//
//  TableViewCell.h
//  tableview-coredata
//
//  Created by Nakib on 3/25/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
- (void) setTitle:(ToDoEntity*) incoming;

@end
