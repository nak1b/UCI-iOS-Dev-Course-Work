//
//  ViewController.m
//  mapView
//
//  Created by Nakib on 2/22/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) MKPointAnnotation* torontoAnnotation;
@property (strong, nonatomic) MKPointAnnotation* vancouverAnnotation;
@property (strong, nonatomic) MKPointAnnotation* houstonAnnotation;
@property (strong, nonatomic) MKPointAnnotation* currentAnnotation;

@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAnnotation];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
}

- (IBAction)torontoClicked:(id)sender {
    [self centerMap:self.torontoAnnotation];
}

- (IBAction)vancouverClicked:(id)sender {
     [self centerMap:self.vancouverAnnotation];
}

- (IBAction)houstonClicked:(id)sender {
     [self centerMap:self.houstonAnnotation];
}

- (IBAction)switchChanged:(UISwitch *)sender {
    if(self.switchBtn.isOn){
        self.mapView.showsUserLocation = YES;
        [self.locationManager startUpdatingLocation];
    }else{
        self.mapView.showsUserLocation = NO;
        [self.locationManager startUpdatingLocation];
    }
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
    self.currentAnnotation.coordinate = locations.lastObject.coordinate;
    [self centerMap:self.currentAnnotation];
}

- (void) centerMap: (MKPointAnnotation *) centerPoint {
    [self.mapView setCenterCoordinate:centerPoint.coordinate animated:true];
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
    
    self.currentAnnotation = [[MKPointAnnotation alloc] init];
    self.currentAnnotation.coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
    self.currentAnnotation.title = @"My Location";
    
    
    [self.mapView addAnnotations: @[self.torontoAnnotation, self.vancouverAnnotation, self.houstonAnnotation]];
}

@end
