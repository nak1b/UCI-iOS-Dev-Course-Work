//
//  ViewController.m
//  tableview-coredata
//
//  Created by Nakib on 3/25/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "ViewController.h"
#import "ToDoEntity.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

 @property (weak, nonatomic) IBOutlet UITextField *todoField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)todoTapped:(id)sender {
    NSString *text = self.todoField.text;
    
    NSManagedObjectContext *ctx = self.context;
    
    //Creating entry
    ToDoEntity *item = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoEntity" inManagedObjectContext:ctx];
    item.title = text;
    
    //saving to coredata
    NSError *error;
    BOOL saveSuccess = [ctx save:&error];
    if(!saveSuccess){
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey:error} ];
    }else{
        self.todoField.text = nil;
    }
    
}

@end
