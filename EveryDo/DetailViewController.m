//
//  DetailViewController.m
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self showDetailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDetailView {
    
    if(self.taskDetail) {
        self.titleLabel.text = [self.taskDetail todoDescription];
        self.toDoDescriptionLabel.text = [self.taskDetail todoDescription];
        self.priorityNumberLabel.text = [self.taskDetail todoDescription];
    }
}

- (void) setDetailItem:(CreateTask *)addNewTask {
    
    if(self.taskDetail != addNewTask) {
        _taskDetail = addNewTask;
        [self showDetailView];
    }
}

@end
