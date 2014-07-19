//
//  DismissController.m
//  MNAnimation
//
//  Created by 陆广庆 on 14/7/19.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "DismissController.h"

@interface DismissController ()

@end

@implementation DismissController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)dismissController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
