//
//  DisplayPreviewViewController.m
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "DisplayPreviewViewController.h"

@interface DisplayPreviewViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *storeTodoLists;

@end

@implementation DisplayPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //allocate an d initialize todos array

    self.storeTodoLists = [[NSMutableArray alloc] init];
    CreateTask *createTaskOne = [[CreateTask alloc] initWithTitle:@"Cleaning" initWithDescription:@"ABCD my room" initWithPriorityNumber:1 initWithIndicator:NO];
    CreateTask *createTaskTwo = [[CreateTask alloc] initWithTitle:@"Cleaning" initWithDescription:@"EFGH Cleaning" initWithPriorityNumber:3 initWithIndicator:YES];
    CreateTask *createTaskThree = [[CreateTask alloc] initWithTitle:@"Washing Car" initWithDescription:@"IJKL my car inside and out" initWithPriorityNumber:4 initWithIndicator:NO];
    CreateTask *createTaskFour = [[CreateTask alloc] initWithTitle:@"Picking up my son" initWithDescription:@"JLSKFPicking him up from daycare center" initWithPriorityNumber:5 initWithIndicator:YES];
    CreateTask *createTaskFive = [[CreateTask alloc] initWithTitle:@"Eating" initWithDescription:@"Eating dinner at Taco place" initWithPriorityNumber:1 initWithIndicator:NO];
    
    [self.storeTodoLists addObject:createTaskOne];
    [self.storeTodoLists addObject:createTaskTwo];
    [self.storeTodoLists addObject:createTaskThree];
    [self.storeTodoLists addObject:createTaskFour];
    [self.storeTodoLists addObject:createTaskFive];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return number of rows that is equal to number of task we have in todos mutable array
    return self.storeTodoLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //set identifier name
    NSString *cellIdentifier = @"newCell";

    CreateNewCell *ToDoTableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    
    
    CreateTask *createTask = self.storeTodoLists[indexPath.row];
    

        ToDoTableViewCell.taskTitle.text = createTask.title;

    
    return ToDoTableViewCell;
}

- (void) configureToDo: (CreateTask *) createTask  {
    
    
}
@end
