//
//  ViewController.m
//  currencyConvertor
//
//  Created by Nakib on 10/17/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
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
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    //enable button
    self.convertBtn.enabled = YES;
    
    double inputValue = [self.userInput.text doubleValue];
    double euroValue = inputValue * currencies.EUR;
    NSString *temp = [NSString stringWithFormat:@"%.2f", euroValue];
    self.currency1.text = temp;
    
    double inrValue = inputValue * currencies.INR;
    temp = [NSString stringWithFormat:@"%.2f", inrValue];
    self.currency2.text = temp;
    
    double yenValue = inputValue * currencies.JPY;
    temp = [NSString stringWithFormat:@"%.2f", yenValue];
    self.currency3.text = temp;
}

@end
