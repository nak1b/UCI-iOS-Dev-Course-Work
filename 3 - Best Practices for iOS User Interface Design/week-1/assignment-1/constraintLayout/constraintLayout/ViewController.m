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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
