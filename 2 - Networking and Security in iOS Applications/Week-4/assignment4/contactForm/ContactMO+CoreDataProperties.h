//
//  ContactMO+CoreDataProperties.h
//  contactForm
//
//  Created by Nakib on 1/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ContactMO.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactMO (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *phone;

@end

NS_ASSUME_NONNULL_END
