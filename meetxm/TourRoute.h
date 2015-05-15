//
//  TourRoute.h
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface TourRoute : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    __weak IBOutlet UITextView *txtWord;
    IBOutlet UIView *alertView;
    __weak IBOutlet UITableView *tableRoute;
}
- (IBAction)clickSpeech:(UIButton *)sender;
- (IBAction)clickClose:(UIButton *)sender;

@end
