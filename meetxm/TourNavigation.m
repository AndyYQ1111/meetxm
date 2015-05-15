//
//  TourNavigation.m
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "TourNavigation.h"
#import "VOTagList.h"
#import "UIViewExt.h"
#import "TourNavigationCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TourNavigation ()

@end

@implementation TourNavigation

- (void)viewDidLoad {
    [super loadBarButton:1];
    [super viewDidLoad];
    
    //设计不透明
    [self.navigationController.navigationBar setTranslucent:NO];
//    [self loadBarButton];
    arr = [[NSArray alloc]initWithObjects:@"观音山",@"鼓浪屿",@"胡里山", nil];
    
    NSArray *tags = @[@"鼓浪屿有什么好玩的？", @"日光岩门票", @"厦门特产", @"厦门有什么特色美食？",@"鼓浪屿特色酒店", @"闽南特色", @"海蛎煎", @"金包银",@"皓月园",@"厦门馅饼",@"菽庄花园",@"厦门比较好的酒吧"];
    VOTagList *tagList = [[VOTagList alloc] initWithTags:tags];
    
    tagList.frame = CGRectMake(20, 170,ScreenWidth-40, ScreenHeight-260);
    tagList.multiLine = YES;
    tagList.multiSelect = YES;
    tagList.allowNoSelection = YES;
    tagList.vertSpacing = 20;
    tagList.horiSpacing = 20;
    tagList.selectedTextColor = [UIColor purpleColor];
    tagList.tagBackgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
    tagList.selectedTagBackgroundColor = [UIColor redColor];
    tagList.tagCornerRadius = 3;
    tagList.tagEdge = UIEdgeInsetsMake(8, 8, 8, 8);
    [tagList addTarget:self action:@selector(selectedTagsChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:tagList];
}


-(void)selectedTagsChanged:(VOTagList *)tag{
    
    NSLog(@"%ld",(long)tag.selectIndex);
}



//添加导航条左右按钮
- (void)loadBarButton {
    UIButton *item1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [item1 setImage:[UIImage imageNamed:@"navback@2x.png"] forState:UIControlStateNormal];
    [item1 addTarget:self action:@selector(navLeftBarClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc] initWithCustomView:item1];
    self.navigationController.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem=leftItem;
    
    UIButton *item=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [item setImage:[UIImage imageNamed:@"navlist@2x.png"] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(navRightBarClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)navLeftBarClick{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

-(void)navRightBarClick{
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 3;
//}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 43;
}
//
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCellIdentifier = @"TourNavigationCell";
    TourNavigationCell *cell;
    cell=(TourNavigationCell*)[tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"TourNavigationCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.lblAddress.text = arr[indexPath.row];
    cell.lblIndex.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [MJAudioTool playMusic:self.musics[indexPath.row]];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [MJAudioTool stopMusic:self.musics[indexPath.row]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
