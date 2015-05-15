//
//  TourNavigation.h
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"


@interface TourNavigation : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    __weak IBOutlet UIView *viewTag;
    
    __weak IBOutlet UITableView *tableScen;
    NSArray *arr;
}
@end
