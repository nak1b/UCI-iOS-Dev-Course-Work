//
//  ViewController.m
//  assignment3
//
//  Created by Nakib on 12/29/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void) notificationPermission{
    UIUserNotificationType types = UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

-(void) createNotificationObject:(int)numOfSec{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.alertTitle = @"Local Notification";
    localNotif.alertBody = @"Notification Body";
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:numOfSec];
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (IBAction)scheduleNotification:(id)sender {
    [self notificationPermission];
    [self createNotificationObject:15];
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
