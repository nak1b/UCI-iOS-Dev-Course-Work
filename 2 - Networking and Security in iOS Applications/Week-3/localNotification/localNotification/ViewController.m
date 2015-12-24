//
//  ViewController.m
//  localNotification
//
//  Created by Nakib on 12/12/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) requestPermissionToNotify;
- (void) createNotification:(int)SecInFuture;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) requestPermissionToNotify{
    UIMutableUserNotificationAction *floatAction = [[UIMutableUserNotificationAction alloc] init];
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title = @"Float";
    floatAction.activationMode = UIUserNotificationActivationModeBackground;
    floatAction.destructive = NO;
    floatAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *stingAction = [[UIMutableUserNotificationAction alloc] init];
    stingAction.identifier = @"STING_ACTION";
    stingAction.title = @"Sting";
    stingAction.activationMode = UIUserNotificationActivationModeForeground;
    stingAction.destructive = NO;
    stingAction.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = @"MAIN_CATEGORY";
    [category setActions:@[floatAction, stingAction] forContext:UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [NSSet setWithObjects:category, nil];
    
    
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void) createNotification:(int)SecInFuture{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:SecInFuture];
    localNotif.alertTitle = @"Local Notif title";
    localNotif.alertBody = @"Notifcation Body";
    localNotif.alertAction = @"Ok";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    
    localNotif.category = @"MAIN_CATEGORY";
    [[UIApplication sharedApplication] scheduledLocalNotifications];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
}

- (IBAction)scheduleNotification:(UIButton *)sender {
    [self requestPermissionToNotify];
    [self createNotification:5];
}

@end
