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
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
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
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
}

- (IBAction)scheduleNotification:(UIButton *)sender {
    [self requestPermissionToNotify];
    [self createNotification:5];
}

@end
