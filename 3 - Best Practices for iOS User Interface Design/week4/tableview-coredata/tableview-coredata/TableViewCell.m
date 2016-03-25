//
//  TableViewCell.m
//  tableview-coredata
//
//  Created by Nakib on 3/25/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import "TableViewCell.h"
#import "ToDoEntity.h"

@implementation TableViewCell

- (void) setTitle:(ToDoEntity*) incoming{
    self.cellLabel.text = incoming.title;
}
@end
