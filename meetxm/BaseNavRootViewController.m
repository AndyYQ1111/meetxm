//
//  BaseNavRootViewController.m
//  聚宝在线
//
//  Created by 岳青山 on 14/12/18.
//  Copyright (c) 2014年 岳青山. All rights reserved.
//

#import "BaseNavRootViewController.h"
//手机屏幕的宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BaseNavRootViewController ()

@end

@implementation BaseNavRootViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    [self.view setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad {
    self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
//    self.hidesBottomBarWhenPushed = NO;
    self.tabBarController.tabBar.hidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)showSingleAlert:(NSString*)tips{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:tips
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

-(void)showServerErrorAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"服务器忙"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
