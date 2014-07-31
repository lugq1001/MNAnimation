//
//  MNPresentDismissAnimation.h
//  MNAnimation
//
//  Created by 陆广庆 on 14/7/19.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef NS_ENUM(NSInteger, MNControllerAnimationType)
{
    MNControllerAnimationTypeGrow,
    MNControllerAnimationTypeShrink,
    MNControllerAnimationTypeFade,
    MNControllerAnimationTypeShrinkWithRotation,
    MNControllerAnimationTypeGrowWithRotation,
    MNControllerAnimationTypeSlideInFromLeft,
    MNControllerAnimationTypeSlideInFromRight,
    MNControllerAnimationTypeSlideInFromTop,
    MNControllerAnimationTypeSlideInFromBottom,
    MNControllerAnimationTypeSlideOutToLeft,
    MNControllerAnimationTypeSlideOutToRight,
    MNControllerAnimationTypeSlideOutToTop,
    MNControllerAnimationTypeSlideOutToBottom,
    MNControllerAnimationTypeSlideInFromLeftWithSpring,
    MNControllerAnimationTypeSlideInFromRightWithSpring,
    MNControllerAnimationTypeSlideInFromTopWithSpring,
    MNControllerAnimationTypeSlideInFromBottomWithSpring
};

@interface MNPresentDismissAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) MNControllerAnimationType animationType;
@property (nonatomic,getter = getDuration) CGFloat duration;

+ (NSArray *)animationsTypeArray;

@end
