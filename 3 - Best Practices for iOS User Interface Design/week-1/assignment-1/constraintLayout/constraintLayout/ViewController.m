//
//  ViewController.m
//  constraintLayout
//
//  Created by Nakib on 1/30/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Loading Webview with the link
    NSString *urlString = @"https://www.facebook.com/NiagaraFallsTourism/";
    NSURLRequest *request  = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.webVIew loadRequest:request];
    
    //Loading location on to the map
    double longitude = -79.0667;
    double lattitde = 43.1167;
    
    MKPointAnnotation *niagraAnnotation = [[MKPointAnnotation alloc] init];
    niagraAnnotation.coordinate = CLLocationCoordinate2DMake(lattitde, longitude);
    niagraAnnotation.title = @"Niagra Falls, Falls View";
    [self.mapView addAnnotation:niagraAnnotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(niagraAnnotation.coordinate, 10000, 10000);
    MKCoordinateRegion adjusted = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjusted animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
