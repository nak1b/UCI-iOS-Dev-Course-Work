//
//  ViewController.m
//  coreData
//
//  Created by Nakib on 12/29/15.
//  Copyright © 2015 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UILabel *choreList;
@property (weak, nonatomic) IBOutlet UITextField *chore_name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    [self updateLogList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addChore:(UIButton *)sender {
    ChoreMO *chore = [self.appDelegate createChoreMO];
    chore.chore_name = self.chore_name.text;
    [self.appDelegate saveContext];
    [self updateLogList];
    
}

-(void) updateLogList{
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Chore"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if(!results){
        NSLog(@"Error fetching request: %@ \n %@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    NSMutableString *buf = [NSMutableString stringWithString:@""];
    
    for(ChoreMO *c in results){
        [buf appendFormat: @"\n%@", c.chore_name, nil];
    }
    self.choreList.text = buf;
}

@end
