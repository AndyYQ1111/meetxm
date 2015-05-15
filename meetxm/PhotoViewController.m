//
//  PhotoViewController.m
//  meetxm
//
//  Created by apple on 15/5/4.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoSeletedViewController.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super loadBarButton:1];
    self.title = @"免费体验照片冲印";
    // Do any additional setup after loading the view.
}

- (IBAction)NextPage:(UIButton *)sender
{
    PhotoSeletedViewController *pV = [self.storyboard instantiateViewControllerWithIdentifier:@"seleted"];
    [self.navigationController pushViewController:pV animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
