//
//  DetailViewController.h
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateTask.h"
@interface DetailViewController : UIViewController


@property (strong, nonatomic) CreateTask *taskDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;

- (void) setDetailItem:(CreateTask *)addNewTask;


@end


