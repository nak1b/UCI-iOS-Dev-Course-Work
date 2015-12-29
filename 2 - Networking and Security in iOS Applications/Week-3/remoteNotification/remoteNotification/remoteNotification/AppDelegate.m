//
//  AppDelegate.m
//  remoteNotification
//
//  Created by Nakib on 12/24/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSDictionary *remoteNotif = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if(remoteNotif){
        NSString *message = remoteNotif[@"aps"][@"alert"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Recieved on launch" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
        });
        
    }
    
    
    //configure parse params
    [Parse setApplicationId:@"lE69GLqdQw1myhz8frSGk3M903vOeI9qRDDtrebc" clientKey:@"E1JU6PECsfvwNtxykiw0HKmwpFClTI80Gf8hpYaL"];
    
    
    
    UIUserNotificationType userNotificationTypes = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
    [application registerUserNotificationSettings:notificationSettings];
    [application registerForRemoteNotifications];
    return YES;
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)remoteNotif{
    
    NSString *message = remoteNotif[@"aps"][@"alert"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Recieved on launch" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
    });

    
}

-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}
@end
