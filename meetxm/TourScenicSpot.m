//
//  TourScenicSpot.m
//  meetxm
//
//  Created by 岳青山 on 15/5/5.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "TourScenicSpot.h"
#import "TourRoute.h"

@interface TourScenicSpot ()

@end

@implementation TourScenicSpot

- (void)viewDidLoad {
    [super viewDidLoad];
    [super loadBarButton:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickgly:(UIButton *)sender {
    
}

- (IBAction)clickhls:(UIButton *)sender {
}

- (IBAction)clickgys:(UIButton *)sender {
    TourRoute *tourRoute = [[TourRoute alloc]init];
    [self.navigationController pushViewController:tourRoute animated:YES];
}
@end
