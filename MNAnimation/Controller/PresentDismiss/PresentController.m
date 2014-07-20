///Users/luguangqing/Projects/iOS/MNAnimation/MNAnimation/Controller/PresentDismiss/PresentController.m
//  PresentController.m
//  MNAnimation
//
//  Created by 陆广庆 on 14/7/19.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "PresentController.h"
#import "PresentDismissAnimation.h"
#import "DismissController.h"

@interface PresentController () <UIViewControllerTransitioningDelegate, UIPickerViewDelegate ,UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *animations;
@property (weak, nonatomic) IBOutlet UIPickerView *presentPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *dismissPicker;

@end

@implementation PresentController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animations = [PresentDismissAnimation animationsTypeArray];
    self.presentPicker.dataSource = self;
    self.presentPicker.delegate = self;
    self.dismissPicker.dataSource = self;
    self.dismissPicker.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.animations count];
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.animations[row];
}

- (IBAction)dismissController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DismissController *dismissController = [segue destinationViewController];;
    dismissController.transitioningDelegate = self;
}

#pragma mark - Transitioning Delegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting
                                                                     sourceController:(UIViewController *)source
{
    PresentDismissAnimation *animation = [PresentDismissAnimation new];
    animation.animationType = [self.presentPicker selectedRowInComponent:0];
    animation.duration = .5f;
    return animation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    PresentDismissAnimation *animation = [PresentDismissAnimation new];
    animation.animationType = [self.dismissPicker selectedRowInComponent:0];
    animation.duration = .5f;
    return animation;
}

@end
