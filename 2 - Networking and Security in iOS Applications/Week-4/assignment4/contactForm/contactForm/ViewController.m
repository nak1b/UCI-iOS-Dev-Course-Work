//
//  ViewController.m
//  contactForm
//
//  Created by Nakib on 1/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ContactMO.h"

@interface ViewController ()

@property (nonatomic) AppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextView *contactLogList;
@property (weak, nonatomic) IBOutlet UILabel *contactCount;

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


- (IBAction)addContact:(UIButton *)sender {
    ContactMO *contact = [self.appDelegate createContactMO];
    contact.name = self.name.text;
    contact.email = self.email.text;
    contact.phone = self.phone.text;
    
    [self.appDelegate saveContext];
    [self updateLogList];
}

- (void) updateLogList{
    NSManagedObjectContext *moc = self.appDelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Contact"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    
    if(!results){
        NSLog(@"Error fetching contact object");
        abort();
    }
    
    NSMutableString *buffer = [NSMutableString stringWithString:@""];
    
    for(ContactMO *c in results){
        [buffer appendFormat:@"\n %@ - %@",c.name, c.email, nil];
        [buffer appendFormat:@"\n Phone: %@ \n",c.phone,nil];
    }
    self.contactLogList.text = buffer;
    self.contactCount.text = [NSString stringWithFormat:@"%lu", (unsigned long)results.count];
}


- (IBAction)deleteRecords:(UIButton *)sender {
}
@end
