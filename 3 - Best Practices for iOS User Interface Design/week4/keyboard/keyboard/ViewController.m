//
//  ViewController.m
//  keyboard
//
//  Created by Nakib on 2/19/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *ctr = [NSNotificationCenter defaultCenter];
    [ctr addObserver:self selector: @selector(moveKeyboardInResponseToShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    
    [ctr addObserver:self selector: @selector(moveKeyboardInResponseToHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)resignBrn:(UIButton *)sender {
    [self.textField resignFirstResponder];
}

- (void) moveKeyboardInResponseToShowNotification:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    CGRect kbRect;
    kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    UIViewAnimationCurve curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    [self.view layoutSubviews];
    
    //Animate
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve: curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.bottomLayout.constant = kbRect.size.height;
    [self.view layoutSubviews];
    [UIView commitAnimations];
}

- (void) moveKeyboardInResponseToHideNotification:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    CGRect kbRect = CGRectZero;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    UIViewAnimationCurve curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    [self.view layoutSubviews];
    
    //Animate
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve: curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.bottomLayout.constant = kbRect.size.height;
    [self.view layoutSubviews];
    [UIView commitAnimations];

}

@end
