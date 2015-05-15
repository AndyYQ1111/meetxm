//
//  TourActivity.h
//  meetxm
//
//  Created by 岳青山 on 15/5/6.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "BaseViewController.h"

@interface TourActivity : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *actArr;
    __weak IBOutlet UICollectionView *activityCollection;
}

@end
