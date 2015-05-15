//
//  ShoppersViewController.m
//  meetxm
//
//  Created by apple on 15/5/5.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "ShoppersViewController.h"

@interface ShoppersViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ShoppersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super loadBarButton:1];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.title=@"导购";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://sz.himall.kuaidiantong.cn/m-Weixin/"]];
    [self.webview loadRequest:request];
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
