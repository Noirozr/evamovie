//
//  webViewController.m
//  eva movie
//
//  Created by Yongjia Liu on 5/12/14.
//  Copyright (c) 2014 Yongjia Liu. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()
{
    float width;
    float height;
}

@end

@implementation webViewController

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
    width=self.view.frame.size.width;
    height=self.view.frame.size.height;
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, width, height-40)];
    NSString *strUrl = [self.urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url =[NSURL URLWithString:strUrl];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    UIButton *Cancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    Cancel.frame = CGRectMake(0,height-40, width, 40);
    Cancel.alpha=0.7;
    [Cancel setTitle:@"Back" forState:UIControlStateNormal];
    Cancel.titleLabel.font=[UIFont fontWithName:@"Avenir" size:30];
    [Cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Cancel setBackgroundColor:[UIColor blackColor]];
    [Cancel addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Cancel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)goback
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
