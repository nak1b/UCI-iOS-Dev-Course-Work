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
    
    self.req = [self.req initWithLocationDescriptions:destArr sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^(NSArray *responses){
        ViewController *strongSelf = weakSelf;
        if(!strongSelf){ return;}
        
        NSNull *badResult = [NSNull null];
        double divider = 0;
        NSString *unit = @"";
        
        if(strongSelf.unitSelector.selectedSegmentIndex == 0){
            divider = 1000.0;
            unit = @"Km";
        }else{
            divider = 1609.34;
            unit = @"Mile";
        }
        
        if(responses[0] != badResult){
            double resA = ([responses[0] floatValue]/divider);
            NSString *a = [NSString stringWithFormat:@"%.2f %@", resA, unit];
            strongSelf.endLabelA.text = a;
        }else{
            strongSelf.endLabelA.text = @"Error";
        }
        
        if(responses[1] != badResult){
            double resB = ([responses[1] floatValue]/divider);
            NSString *b = [NSString stringWithFormat:@"%.2f %@", resB, unit];
            strongSelf.endLabelB.text = b;

        }else{
            strongSelf.endLabelB.text = @"Error";
        }
        
        if(responses[2] != badResult){
            double resC = ([responses[2] floatValue]/divider);
            NSString *c = [NSString stringWithFormat:@"%.2f %@", resC, unit];
            strongSelf.endLabelC.text = c;

        }else{
             strongSelf.endLabelC.text = @"Error";
        }
        
        strongSelf.req = nil;
        strongSelf.calculateBtn.enabled = YES;
    };
    
    [self.req start];
    
   
    
}

@end
