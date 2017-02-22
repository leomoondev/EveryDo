//
//  CreateTask.m
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "CreateTask.h"

@implementation CreateTask

- (instancetype)initWithTitle : (NSString *) title initWithDescription : (NSString *) todoDescription initWithPriorityNumber : (int) priorityNumber initWithIndicator : (BOOL) isCompletedIndicator {
    if (self = [super init]) {
        self.title = title;
        self.todoDescription = todoDescription;
        self.priorityNumber = priorityNumber;
        self.isCompletedIndicator = isCompletedIndicator;
        
    }
    return self;
}
@end
