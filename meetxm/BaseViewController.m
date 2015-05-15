//
//  BaseViewController.m
//  聚宝在线
//
//  Created by 岳青山 on 14/12/18.
//  Copyright (c) 2014年 岳青山. All rights reserved.
//

#import "BaseViewController.h"
//手机屏幕的宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//添加导航条左右按钮
-(void)loadBarButton:(NSInteger)rightItemType {
    
    self.rightItemType = rightItemType;
    
    UIButton *item1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [item1 setImage:[UIImage imageNamed:@"navback@2x.png"] forState:UIControlStateNormal];
    [item1 addTarget:self action:@selector(navLeftBarClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithCustomView:item1];
    self.navigationController.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *item=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [item setImage:[UIImage imageNamed:@"navlist@2x.png"] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(navRightBarClick) forControlEvents:UIControlEventTouchUpInside];
    
//    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithCustomView:item];
//    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)navLeftBarClick{
    if([self.navigationController.viewControllers count]>1){
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

-(void)navRightBarClick{
    
    NSLog(@"%ld",(long)self.rightItemType);
    
    switch (self.rightItemType) {
        case 1:
           
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
    
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
