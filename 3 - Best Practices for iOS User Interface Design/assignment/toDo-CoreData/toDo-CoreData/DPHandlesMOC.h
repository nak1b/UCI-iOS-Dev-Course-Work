//
//  DPHandlesMOC.h
//  toDo-CoreData
//
//  Created by Nakib on 4/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPHandlesMOC <NSObject>

- (void) recieveMOC: (NSManagedObjectContext *)incomingMOC;

@end
