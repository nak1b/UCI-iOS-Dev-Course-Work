//
//  ViewController.m
//  DistanceCalculator
//
//  Created by Nakib on 11/11/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelector;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UITextField *endLocationC;

@property (weak, nonatomic) IBOutlet UILabel *endLabelA;
@property (weak, nonatomic) IBOutlet UILabel *endLabelB;
@property (weak, nonatomic) IBOutlet UILabel *endLabelC;

@property (weak, nonatomic) IBOutlet UIButton *calculateBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateBtnPressed:(id)sender {
    self.calculateBtn.enabled = NO;
    self.req = [DGDistanceRequest alloc];
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationB.text;
    NSString *destC = self.endLocationC.text;
    
    NSArray *destArr = @[destA, destB, destC];
    self.endLabelA.text = start;
    
    self.req = [self.req initWithLocationDescriptions:destArr sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^(NSArray *responses){
        ViewController *strongSelf = weakSelf;
        if(!strongSelf){ return;}
        
        self.endLocationC.text = @"Working";
        self.calculateBtn.enabled = YES;
        self.req = nil;
      
    };
    
    [self.req start];
    
   
    
}

@end
