//
//  AppDelegate.m
//  assignment3
//
//  Created by Nakib on 12/29/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UILocalNotification *localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    
    if(localNotif){
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Recieved on Launch" message:localNotif.alertBody preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okey" style:UIAlertActionStyleDefault handler:nil];
        [controller addAction:action];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:controller animated:false completion:nil];
        });
        
    }
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Recieved while running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Okey" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:action];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:controller animated:false completion:nil];
    });
    
}
@end
