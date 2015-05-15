//
//  OrderViewController.m
//  meetxm
//
//  Created by apple on 15/5/7.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "OrderViewController.h"
#import "UIImageView+WebCache.h"
@interface OrderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation OrderViewController

@synthesize imgStr;

- (void)viewDidLoad {
    [super loadBarButton:1];
    [super viewDidLoad];
    
    self.title = @"订单详情";
}

-(void) viewWillAppear:(BOOL)animated{
    [self loadImage];
}
-(void)loadImage
{
    NSLog(@"%@",imgStr);
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
