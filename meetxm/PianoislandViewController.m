//
//  PianoislandViewController.m
//  meetxm
//
//  Created by apple on 15/5/4.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "PianoislandViewController.h"

@interface PianoislandViewController ()

@end

@implementation PianoislandViewController

- (void)viewDidLoad {
    [super loadBarButton:1];
    [super viewDidLoad];
    self.title  = @"景点介绍";

    UIImageView *tipImage = [[UIImageView alloc]initWithFrame:CGRectMake(200, self.view.frame.size.height*0.3, 40, 60)];
    tipImage.image = [UIImage imageNamed:@"tip.png"];
    [self.view addSubview:tipImage];
    [UIView animateWithDuration:1.5 animations:^{
        CGFloat tipX = tipImage.frame.origin.x;
        for (int i=0; i<100; i++) {
            tipX --;
            tipImage.frame = CGRectMake(tipX, self.view.frame.size.height*0.3, 40, 60);
        }
    } completion:^(BOOL finished) {
        [tipImage removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
