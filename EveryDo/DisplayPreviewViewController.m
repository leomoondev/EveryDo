//
//  DisplayPreviewViewController.m
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "DisplayPreviewViewController.h"

@interface DisplayPreviewViewController ()<UITableViewDelegate, UITableViewDataSource, AddNewTaskViewController>
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
    

    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToCheckDone:)];
    [self.tableView addGestureRecognizer:swipeGestureRecognizer];
    
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
    
        if (createTask.isCompletedIndicator) {
            NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc]initWithString:createTask.title];
            NSMutableAttributedString *descriptionString = [[NSMutableAttributedString alloc]initWithString:createTask.todoDescription];
            NSMutableAttributedString *priorityString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%i",createTask.priorityNumber]];
    
            [titleString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0,[titleString length])];
    
            [descriptionString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0,[descriptionString length])];
    
            [priorityString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0,[priorityString length])];
    
            ToDoTableViewCell.taskTitle.attributedText = titleString;
            ToDoTableViewCell.taskDescription.attributedText = descriptionString;
            ToDoTableViewCell.taskPriority.attributedText = priorityString;
        }
    else {
            ToDoTableViewCell.taskTitle.text = createTask.title;
            ToDoTableViewCell.taskDescription.text = createTask.todoDescription;
            ToDoTableViewCell.taskPriority.text = [NSString stringWithFormat:@"%i",createTask.priorityNumber];

    }
    return ToDoTableViewCell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goToDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CreateTask *todoToBeDetailed = self.storeTodoLists[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todoToBeDetailed];
    }
    
    if ([[segue identifier] isEqualToString:@"goToDetailViewFromAddNew"]) {
        AddNewTaskViewController *addNewTaskViewController = segue.destinationViewController;
        addNewTaskViewController.delegate = self;
    }
}
- (void)addNew:(CreateTask *)createTask {
    
    [self.storeTodoLists insertObject:createTask atIndex:0];
    
    
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)swipeToCheckDone:(UISwipeGestureRecognizer *)sender {
    

    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[sender locationInView:self.tableView]];
    CreateTask *createTask = self.storeTodoLists[indexPath.row];

    if (createTask.isCompletedIndicator == YES) {
        createTask.isCompletedIndicator = NO;
    }
    else {
        createTask.isCompletedIndicator = YES;
    }
    
    // Update the tableview
    [self.tableView reloadData];
    
    
}

@end
