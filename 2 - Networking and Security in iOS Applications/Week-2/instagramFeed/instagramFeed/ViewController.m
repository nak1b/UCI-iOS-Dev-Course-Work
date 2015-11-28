//
//  ViewController.m
//  instagramFeed
//
//  Created by Nakib on 11/23/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "NXOAuth2.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logoutBtn.enabled = false;
    self.refreshBtn.enabled = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:@"Instagram"];
    self.logoutBtn.enabled = true;
    self.refreshBtn.enabled = true;
    self.loginBtn.enabled = false;
}


- (IBAction)logoutBtnPressed:(UIButton *)sender {
    NXOAuth2AccountStore *store = [NXOAuth2AccountStore sharedStore];
   
    //getting all logged in instagram acount
    NSArray *instagramAccounts = [store accountsWithAccountType:@"Instagram"];
    
    //removing any logged in instragm account
    for(id account in instagramAccounts){
        [store removeAccount:account];
    }
    self.logoutBtn.enabled = false;
    self.refreshBtn.enabled = false;
    self.loginBtn.enabled = true;
}

- (IBAction)refreshBtnPressed:(UIButton *)sender {
    NSArray *instagramAccounts = [[NXOAuth2AccountStore sharedStore] accountsWithAccountType:@"Instagram"];
    if([instagramAccounts count]==0){
        NSLog(@"No account logged in ");
        return;
    }
    
    NXOAuth2Account *accout = instagramAccounts[0];
    NSString *token = accout.accessToken.accessToken;
    
    NSString *urlString = [@"https://api.instagram.com/v1/users/self/media/recent/?access_token=" stringByAppendingString:token];
   
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //check for network error
        if(error){
            NSLog(@"Can not finish the request %@", error);
            return;
        }
        
        //check http error
        NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
        if (httpResp.statusCode <200 || httpResp.statusCode >=300) {
             NSLog(@"Error: Got status code %ld", (long) httpResp.statusCode);
            return;
        }
        
        //check json parser error
        NSError *parseErr;
        id pkg = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseErr];
        if(!pkg){
            NSLog(@"Couldnt parse json %@", parseErr);
            return;
        }
        
        NSString *imgUrlStr = pkg[@"data"][0][@"images"][@"standard_resolution"][@"url"];
        NSURL *imgUrl = [NSURL URLWithString:imgUrlStr];
        [[session dataTaskWithURL:imgUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
            //check for network error
            if(error){
                NSLog(@"Can not finish the request %@", error);
                return;
            }
            
            //check http error
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
            if (httpResp.statusCode <200 || httpResp.statusCode >=300) {
                NSLog(@"Error: Got status code %ld", (long) httpResp.statusCode);
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData:data];
            });
            

        }] resume];
      

    }] resume];
}

@end
