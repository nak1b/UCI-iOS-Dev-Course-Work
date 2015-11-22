//
//  ViewController.m
//  Social Integration
//
//  Created by Nakib on 11/21/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *twitterTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextViewStyle];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertMessage:(NSString*) msg{
    UIAlertController *warningController = [UIAlertController alertControllerWithTitle:msg message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *warningAction = [UIAlertAction actionWithTitle:@"Okey" style:UIAlertActionStyleDefault handler:nil];
    [warningController addAction:warningAction];
    [self presentViewController:warningController animated:YES completion:nil];
}

- (IBAction)shareTweetPressed:(UIBarButtonItem *)sender {
    //closing if keyboard open
    if([self.twitterTextView isFirstResponder]){
        [self.twitterTextView resignFirstResponder];
    }
   
    //Creating Modal
    UIAlertController *twitterAlert = [UIAlertController alertControllerWithTitle:@"Twitter Share" message:@"Some Message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *share = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                            ^(UIAlertAction* action){
                                if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
                                    SLComposeViewController *twitterAlertController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                                    [twitterAlertController setInitialText:self.twitterTextView.text];
                                    [self presentViewController:twitterAlertController animated:YES completion:nil];
                                }else{
                                    [self showAlertMessage:@"Please singin to twitter"];
                                }
                            }];
    
    [twitterAlert addAction:share];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@
                             "Cancel" style:UIAlertActionStyleCancel handler:nil];
    [twitterAlert addAction:cancel];
    [self presentViewController:twitterAlert animated:YES completion:nil];
}

- (void)configureTextViewStyle{
    self.twitterTextView.layer.backgroundColor = [UIColor colorWithRed:252/255.0 green:216/255.0 blue:199/255.0 alpha:1].CGColor;
}

@end
