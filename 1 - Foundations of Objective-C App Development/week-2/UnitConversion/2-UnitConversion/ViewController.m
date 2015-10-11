//
//  ViewController.m
//  2-UnitConversion
//
//  Created by Nakib on 9/26/15.
//  Copyright (c) 2015 Nakib. All rights reserved.
//

#import "ViewController.h"

double toFeet(double value){
    return 0.0833333*value;
}

double toMeter(double value){
    return 0.0254*value;
}

double toCm(double value){
    return 2.54*value;
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

- (IBAction)update:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    
    double userInput = [self.inputField.text doubleValue];
    
    if(self.segmentController.selectedSegmentIndex ==0){
        double result = toFeet(userInput);
        [buf appendString: [@(result) stringValue]];
        
    }else if (self.segmentController.selectedSegmentIndex == 1){
        
        double result = toMeter(userInput);
        [buf appendString: [@(result) stringValue]];
        
    }else{
        double result = toCm(userInput);
        [buf appendString: [@(result) stringValue]];
    }
    
    self.outputField.text = buf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
