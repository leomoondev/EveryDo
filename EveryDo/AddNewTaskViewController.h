//
//  AddNewTaskViewController.h
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateTask.h"

@protocol AddNewTaskViewController <NSObject>

- (void)addNew:(CreateTask*) newCreateTask;

@end

@interface AddNewTaskViewController : UIViewController

@property (weak, nonatomic) id <AddNewTaskViewController> delegate;

@end
