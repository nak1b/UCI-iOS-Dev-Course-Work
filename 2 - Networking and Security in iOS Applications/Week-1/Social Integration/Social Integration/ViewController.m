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
@property (weak, nonatomic) IBOutlet UITextView *fbTextView;
@property (weak, nonatomic) IBOutlet UITextView *activityTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTwitterTextViewStyle];
    [self configureFbTextViewStyle];
    [self configureActivityTextViewStyle];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertMessage:(NSString*) msg{
    UIAlertController *warningController = [UIAlertController alertControllerWithTitle:@"Social Share" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *warningAction = [UIAlertAction actionWithTitle:@"Okey" style:UIAlertActionStyleDefault handler:nil];
    [warningController addAction:warningAction];
    [self presentViewController:warningController animated:YES completion:nil];
}

//Twitter Sharing
- (IBAction)shareTweetPressed:(UIBarButtonItem *)sender {
    //closing if keyboard open
    if([self.twitterTextView isFirstResponder]){
        [self.twitterTextView resignFirstResponder];
    }
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        NSString *tweetText;
        //checking if length of text is less then 140
        if([self.twitterTextView.text length]<140){
            tweetText = self.twitterTextView.text;
        }else{
            tweetText = [self.twitterTextView.text substringToIndex:140];
        }
        SLComposeViewController *twitterAlertController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterAlertController setInitialText:tweetText];
        [self presentViewController:twitterAlertController animated:YES completion:nil];
        
    }else{
        [self showAlertMessage:@"Please singin to twitter"];
    }
   
 
}

//Facebook Sharing
- (IBAction)fbSharePress:(UIBarButtonItem *)sender {
    if([self.fbTextView isFirstResponder]){
        [self.fbTextView resignFirstResponder];
    }
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        SLComposeViewController *fbController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fbController setInitialText:self.fbTextView.text];
        [self presentViewController:fbController animated:YES completion:nil];
    }else{
        [self showAlertMessage:@"Please singin to facebook before"];
    }
}

//Activity View
- (IBAction)activityBtnPress:(UIBarButtonItem *)sender {
    if([self.activityTextView isFirstResponder]){
        [self.activityTextView resignFirstResponder];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[self.activityTextView.text] applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}


//Alert Controller
- (IBAction)showAlertViewController:(UIBarButtonItem *)sender {
    [self showAlertMessage:@"This do nothing"];
}


//Style for Twitter text views
- (void)configureTwitterTextViewStyle{
    self.twitterTextView.layer.backgroundColor = [UIColor colorWithRed:252/255.0 green:216/255.0 blue:199/255.0 alpha:1].CGColor;
}

//Style for facebook text views
- (void)configureFbTextViewStyle{
    self.fbTextView.layer.backgroundColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1.0].CGColor;
}

//Style fot alert text view
- (void)configureActivityTextViewStyle{
     self.activityTextView.layer.backgroundColor = [UIColor colorWithRed:189/255.0 green:195/255.0 blue:199/255.0 alpha:1.0].CGColor;
}

@end
