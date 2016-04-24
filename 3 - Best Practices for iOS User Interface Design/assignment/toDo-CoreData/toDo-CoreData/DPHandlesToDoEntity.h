//
//  DPHandlesToDoEntity.h
//  toDo-CoreData
//
//  Created by Nakib on 4/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPHandlesToDoEntity <NSObject>

-(void) recieveToDoEntity: (ToDoEntity *) incomingToDoEntity;

@end
