//
//  MyUINavigationController.m
//  toDo-CoreData
//
//  Created by Nakib on 4/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "MyUINavigationController.h"

@interface MyUINavigationController () 

@property (strong, nonatomic) NSManagedObjectContext *managedbjectContext;

@end

@implementation MyUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC{
    self.managedbjectContext = incomingMOC;
    id <DPHandlesMOC> child = (id<DPHandlesMOC>) self.viewControllers[0];
    [child recieveMOC:self.managedbjectContext];
}

@end
