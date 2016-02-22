//
//  ViewController.m
//  mapView
//
//  Created by Nakib on 2/22/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) MKPointAnnotation* torontoAnnotation;
@property (strong, nonatomic) MKPointAnnotation* vancouverAnnotation;
@property (strong, nonatomic) MKPointAnnotation* houstonAnnotation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAnnotation];
    
}

- (IBAction)torontoClicked:(id)sender {
}

- (IBAction)vancouverClicked:(id)sender {
}

- (IBAction)houstonClicked:(id)sender {
}


- (void) addAnnotation{
}

@end
