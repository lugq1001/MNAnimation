//
//  StretchCellController.m
//  MNAnimation
//
//  Created by 陆广庆 on 14/7/19.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "StretchCellController.h"

@interface StretchCellController ()

@property (nonatomic) BOOL cellShowing;
@property (weak, nonatomic) IBOutlet UIView *cellContent;

@end

@implementation StretchCellController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1 && !self.cellShowing)
        return 0.0f;
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (IBAction)click:(id)sender
{
    self.cellShowing = !self.cellShowing;
    [self stretchCell:self.cellShowing];
}

- (void)stretchCell:(BOOL)stretch
{
    if (stretch) {
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        
        self.cellContent.hidden = NO;
        self.cellContent.alpha = 0.0f;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.cellContent.alpha = 1.0f;
        }];
    } else {
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        [UIView animateWithDuration:0.25 animations:^{
            self.cellContent.alpha = 0.0f;
        } completion:^(BOOL finished){
            self.cellContent.hidden = YES;
        }];
    }
}

@end
