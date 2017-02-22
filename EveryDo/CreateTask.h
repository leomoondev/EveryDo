//
//  CreateTask.h
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreateTask : NSObject

@property NSString *title;
@property NSString *todoDescription;
@property int priorityNumber;
@property BOOL isCompletedIndicator;


- (instancetype)initWithTitle : (NSString *) title initWithDescription : (NSString *) todoDescription initWithPriorityNumber : (int) priorityNumber initWithIndicator : (BOOL) isCompletedIndicator;
@end
