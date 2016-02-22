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
    self.torontoAnnotation = [[MKPointAnnotation alloc] init];
    self.torontoAnnotation.coordinate = CLLocationCoordinate2DMake(43.717899, -79.6582407);
    self.torontoAnnotation.title = @"Toronto";
    
    self.vancouverAnnotation = [[MKPointAnnotation alloc] init];
    self.vancouverAnnotation.coordinate = CLLocationCoordinate2DMake(49.2562176, -123.1939537);
    self.vancouverAnnotation.title = @"Vancouver";
    
    self.houstonAnnotation = [[MKPointAnnotation alloc] init];
    self.houstonAnnotation.coordinate = CLLocationCoordinate2DMake(29.8174782, -95.6814916);
    self.houstonAnnotation.title = @"Houston";
    
    
    [self.mapView addAnnotations: @[self.torontoAnnotation, self.vancouverAnnotation, self.houstonAnnotation]];
}

@end
