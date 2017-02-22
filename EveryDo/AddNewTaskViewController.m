//
//  AddNewTaskViewController.m
//  EveryDo
//
//  Created by Hyung Jip Moon on 2017-02-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "AddNewTaskViewController.h"

@interface AddNewTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tittleField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *priorityField;

@end

@implementation AddNewTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addTodoListButtonTapped:(id)sender {
    
    CreateTask *newCreateTask = [[CreateTask alloc] initWithTitle:self.tittleField.text initWithDescription:self.descriptionField.text initWithPriorityNumber:[self.priorityField.text intValue] initWithIndicator:nil];

    [self.delegate addNew:newCreateTask];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end



