//
//  Animator.m
//  eva movie
//
//  Created by Yongjia Liu on 5/11/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "Animator.h"

@implementation Animator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController= [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController=[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha=0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform=CGAffineTransformMakeScale(0, 0);
        toViewController.view.alpha=1;
    }completion:^(BOOL finished){
        fromViewController.view.transform=CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
