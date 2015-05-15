//
//  MassageViewController.m
//  meetxm
//
//  Created by Xiakexing on 15/5/11.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "MassageViewController.h"

@interface MassageViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation MassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super loadBarButton:1];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.title=@"全身按摩";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ebwing.com/download/appindex.do#"]];
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
