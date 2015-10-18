//
//  ViewController.m
//  currencyConvertor
//
//  Created by Nakib on 10/17/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userInput;
@property (weak, nonatomic) IBOutlet UILabel *currency1;
@property (weak, nonatomic) IBOutlet UILabel *currency2;
@property (weak, nonatomic) IBOutlet UILabel *currency3;
@property (weak, nonatomic) IBOutlet UIButton *convertBtn;

@end

@implementation ViewController

- (IBAction)convertPress:(id)sender {
    //disable  button
    self.convertBtn.enabled = NO;
    
    self.currency1.text = @"A";
    self.currency2.text = @"B";
    self.currency3.text = @"C";
    
    //disable  button
    self.convertBtn.enabled = YES;
}


@end
