//
//  loadViewController.m
//  eva movie
//
//  Created by Yongjia Liu on 5/11/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "loadViewController.h"
#import "mainViewController.h"
#import "secondViewController.h"
#import "thirdViewController.h"
#import "Animator.h"

#define VisiblePosition CGPointMake(2*width/5+45, 2*height/3-50)
#define VisibleReadyPosition CGPointMake(2*width/5+45,height/2)
#define HiddenPosition CGPointMake(2*width/5+45,height/2+10)

@interface loadViewController ()<UIViewControllerTransitioningDelegate>
{
    float width;
    float height;
    UIColor *evil;
    UIColor *pure;
    UIColor *joColor;
    UIColor *haColor;
    UIColor *kyuColor;
    UIView *easyMask;
    UIView *alert;
    BOOL alertiseven;
}
@property (nonatomic,strong)Animator *animator;
@end

@implementation loadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    alertiseven=YES;
    _animator=[Animator new];
    width=self.view.frame.size.width;
    height=self.view.frame.size.height;
    evil=[UIColor blackColor];
    pure=[UIColor whiteColor];
    joColor=[UIColor colorWithRed:0.93 green:0.93 blue:0.92 alpha:1];;
    haColor=[UIColor colorWithRed:0.89 green:0.49 blue:0.1 alpha:1];
    kyuColor=[UIColor colorWithRed:0.1 green:0.65 blue:0.74 alpha:1];
    
    [self.view setBackgroundColor:evil];
    UIImageView *bgimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    bgimage.image=[UIImage imageNamed:@"bgimage.jpg"];
    [self.view addSubview:bgimage];
    
    easyMask=[[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    [easyMask setBackgroundColor:evil];
    easyMask.alpha=0.4;
    [self.view addSubview:easyMask];
    
    UILabel *loadingLabel=[[UILabel alloc]initWithFrame:CGRectMake(width/5+5, height/3+50, 400, 45)];
    loadingLabel.textAlignment=NSTextAlignmentCenter;
    loadingLabel.textColor=pure;
    loadingLabel.font=[UIFont fontWithName:@"Avenir" size:40];
    loadingLabel.text=@"Rebuild of Evangelion";
    [self.view addSubview:loadingLabel];
    
    UILabel *detail=[[UILabel alloc]initWithFrame:CGRectMake(width/5+7, 2*height/3-150,  450, 200)];
    detail.text=@"Evangelion: 1.0 You Are (Not) Alone\nEvangelion: 2.0 You Can (Not) Advance\nEvangelion: 3.0 You Can (Not) Redo";
    detail.textColor=pure;
    detail.font=[UIFont fontWithName:@"Avenir" size:24];
    detail.lineBreakMode=NSLineBreakByWordWrapping;
    detail.numberOfLines=0;
    [self.view addSubview:detail];
    
    UIButton *Jo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Jo.frame = CGRectMake(width/5,height/2-50, 100.0, 100.0);
    [Jo setTitle:@"序" forState:UIControlStateNormal];
    Jo.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [Jo setTitleColor:evil forState:UIControlStateNormal];
    [Jo setBackgroundColor:joColor];
    Jo.layer.cornerRadius=50;
    Jo.layer.masksToBounds=YES;
    [Jo addTarget:self action:@selector(buttonClickedJo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Jo];
    
    UIButton *Ha = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Ha.frame = CGRectMake(2*width/5,height/2-50, 100.0, 100.0);
    [Ha setTitle:@"破" forState:UIControlStateNormal];
    Ha.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [Ha setTitleColor:evil forState:UIControlStateNormal];
    [Ha setBackgroundColor:haColor];
    Ha.layer.cornerRadius=50;
    Ha.layer.masksToBounds=YES;
    [Ha addTarget:self action:@selector(buttonClickedHa:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Ha];
    
    UIButton *Kyu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Kyu.frame = CGRectMake(3*width/5,height/2-50, 100.0, 100.0);
    [Kyu setTitle:@"Q" forState:UIControlStateNormal];
    Kyu.titleLabel.font=[UIFont fontWithName:@"Georgia" size:30];
    [Kyu setTitleColor:evil forState:UIControlStateNormal];
    [Kyu setBackgroundColor:kyuColor];
    Kyu.layer.cornerRadius=50;
    Kyu.layer.masksToBounds=YES;
    [Kyu addTarget:self action:@selector(buttonClickedKyu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Kyu];
    
    alert=[[UIView alloc]initWithFrame:CGRectMake(275, 60, 470, 100)];
    alert.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    alert.layer.position = HiddenPosition;
    alert.layer.opacity = 0.0f;
    alert.layer.cornerRadius = 4.0f;
    [alert setBackgroundColor:[UIColor colorWithRed:0.1 green:0.09 blue:0.28 alpha:1]];
    [self.view addSubview:alert];
    UILabel *clicktoEnter=[[UILabel alloc]initWithFrame:alert.bounds];
    clicktoEnter.text=@"Tap the button above to Enter";
    clicktoEnter.font=[UIFont fontWithName:@"Avenir" size:24];
    clicktoEnter.textAlignment=NSTextAlignmentCenter;
    clicktoEnter.textColor=pure;
    [alert addSubview:clicktoEnter];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showalert)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void) buttonClickedJo:(id)sender
{
    mainViewController *mvc=[[mainViewController alloc]init];
    mvc.transitioningDelegate=self;
    [self presentViewController:mvc animated:YES completion:nil];
}
-(void) buttonClickedHa:(id)sender
{
    secondViewController *svc=[[secondViewController alloc]init];
    svc.transitioningDelegate=self;
    [self presentViewController:svc animated:YES completion:nil];
}
-(void) buttonClickedKyu:(id)sender
{
    thirdViewController *tvc=[[thirdViewController alloc]init];
    tvc.transitioningDelegate=self;
    [self presentViewController:tvc animated:YES completion:nil];
}
-(void)showalert
{
    if (alertiseven) {
        alertiseven=!alertiseven;
        POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation.fromValue = @(0);
        opacityAnimation.toValue = @(1);
        opacityAnimation.beginTime = CACurrentMediaTime() + 0.1;
        [alert.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:VisibleReadyPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:VisiblePosition];
        [alert.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];//@(0.0f);
        scaleAnimation.springBounciness = 20.0f;
        scaleAnimation.springSpeed = 20.0f;
        [alert.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        easyMask.alpha=0.7;
    }else{
        alertiseven=!alertiseven;
        POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        opacityAnimation.fromValue = @(1);
        opacityAnimation.toValue = @(0);
        [alert.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        
        POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:VisiblePosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:HiddenPosition];
        [alert.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        
        scaleAnimation.fromValue  = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        scaleAnimation.toValue  = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
        [alert.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        easyMask.alpha=0.4;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animator;
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.animator;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
