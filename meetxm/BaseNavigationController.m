//
//  BaseNavigationController.m
//  聚宝在线
//
//  Created by 岳青山 on 14/12/18.
//  Copyright (c) 2014年 岳青山. All rights reserved.
//

#import "BaseNavigationController.h"
//手机屏幕的宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarbg.png"]forBarMetrics:UIBarMetricsDefault];
    
//    默认带有一定透明效果，可以使用以下方法去除系统效果
    
//    [self.navigationBar setTranslucent:NO];

    // Do any additional setup after loading the view.
    //判断释放可以调用setBackgroundImage这个函数来设置bar的背景（5.0版本以上可以）
//    if([self.navigationBar respondsToSelector:
//        @selector(setBackgroundImage:forBarMetrics:)]){
//        [self.navigationBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

