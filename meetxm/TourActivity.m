//
//  TourActivity.m
//  meetxm
//
//  Created by 岳青山 on 15/5/6.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "TourActivity.h"
#import "TourActivityCell.h"
#import "PhotoSeletedViewController.h"
#import "MassageViewController.h"
#import "BaseNavigationController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TourActivity ()

@end

@implementation TourActivity

- (void)viewDidLoad {
    [super loadBarButton:1];
    [super viewDidLoad];
    self.title =@"活动咨询";
    
    actArr =[NSArray arrayWithObjects:@"activity01.png",@"activity03.png",@"activity02.png", nil];
    [activityCollection registerClass:[TourActivityCell class] forCellWithReuseIdentifier:@"TourActivityCell"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return actArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"TourActivityCell";
    TourActivityCell *cell = (TourActivityCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell.activityImg setImage:[UIImage imageNamed:actArr[indexPath.row]]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        MassageViewController *massage = [self.storyboard instantiateViewControllerWithIdentifier:@"massage"];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:massage];
        [self presentViewController:nav animated:YES completion:nil];
    }
    if(indexPath.row == 1){
        PhotoSeletedViewController *pV = [self.storyboard instantiateViewControllerWithIdentifier:@"seleted"];
        [self.navigationController pushViewController:pV animated:YES];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth-20, (ScreenWidth-20)*0.54);
}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
