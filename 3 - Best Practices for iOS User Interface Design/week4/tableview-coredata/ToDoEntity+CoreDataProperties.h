//
//  ToDoEntity+CoreDataProperties.h
//  tableview-coredata
//
//  Created by Nakib on 3/25/16.
//  Copyright © 2016 Nakib. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
