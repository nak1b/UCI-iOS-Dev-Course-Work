//
//  MyUIViewController.h
//  toDo-CoreData
//
//  Created by Nakib on 4/24/16.
//  Copyright © 2016 Nakib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesMOC.h"

@interface MyUIViewController : UIViewController <DPHandlesMOC>

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC;

@end
