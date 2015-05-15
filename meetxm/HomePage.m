//
//  HomePage.m
//
//
//  Created by 岳青山 on 15/5/3.
//
//

#import "HomePage.h"
#import "TourBrowse.h"
#import "TourRoute.h"
#import "PianoislandViewController.h"
#import "ShoppersViewController.h"
#import "TourNavigation.h"
#import "TourScenicSpot.h"
#import "BaseNavigationController.h"
#import "TourActivity.h"
#import "MyAnimationUtil.h"
#import "PhotoViewController.h"
#import "MoreSettingCell.h"
#import "MassageViewController.h"
@interface HomePage ()

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[CBCentralManager alloc]initWithDelegate:self queue:nil];
    
    _moreTabView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bottom"]];
    //self.MoreTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MoreSetting.plist" ofType:nil];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    _dataArr = array;
    [self setExtraCellLineHidden:self.moreTabView];
    [self loadIbeaconSdk];
}

/**
 *  初始化iBeaconSDK
 */
- (void)loadIbeaconSdk{
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    [self.beaconManager requestAlwaysAuthorization];
    self.region01 = [[ESTBeaconRegion alloc]initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID identifier:@"EstimoteSampleRegion"];
    [self startRangingBeacons];
}

/**
 *  iBeaconSDK 开始扫描基站
 */
-(void)startRangingBeacons
{
    NSLog(@"%@",self.region01);
    if ([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        [self.beaconManager requestAlwaysAuthorization];
        [self.beaconManager startRangingBeaconsInRegion:self.region01];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
    {
        [self.beaconManager startRangingBeaconsInRegion:self.region01];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Access Denied"
                                                        message:@"You have denied access to location services. Change this in app settings."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                              
                                              otherButtonTitles: nil];
        
        [alert show];
    }
    else if([ESTBeaconManager authorizationStatus] == kCLAuthorizationStatusRestricted)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Not Available"
                                                        message:@"You have no access to location services."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //    [self.beaconManager stopRangingBeaconsInRegion:self.region01];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickRight:(UIButton *)sender {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromLeft;
    
    NSUInteger moreInt = [[self.view subviews] indexOfObject:moreView];
    NSUInteger homePageInt = [[self.view subviews] indexOfObject:homePageView];
    
    [self.view exchangeSubviewAtIndex:homePageInt withSubviewAtIndex:moreInt];
    
    
    [[self.view layer] addAnimation:animation forKey:@"animation"];
    
}

- (IBAction)clickLeft:(UIButton *)sender {
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.3;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //    animation.type = kCATransitionPush;
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromRight;
    
    NSUInteger moreInt = [[self.view subviews] indexOfObject:moreView];
    NSUInteger homePageInt = [[self.view subviews] indexOfObject:homePageView];
    
    [self.view exchangeSubviewAtIndex:moreInt withSubviewAtIndex:homePageInt];
    
    
    [[self.view layer] addAnimation:animation forKey:@"animation"];
}

- (IBAction)clickDy:(UIButton *)sender {
    TourScenicSpot *tourScenicSpot = [self.storyboard instantiateViewControllerWithIdentifier:@"tourscenicspot"];
    
    BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:tourScenicSpot];
    [self presentViewController:nav animated:YES completion:^{
    }];
}

- (IBAction)clickDl:(UIButton *)sender {
    TourBrowse *tourBrowse= [[TourBrowse alloc]init];
    UINavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:tourBrowse];
    [self presentViewController:nav animated:YES completion:^{
    }];
}

- (IBAction)clickDh:(UIButton *)sender {
    TourNavigation *tourNav = [[TourNavigation alloc]init];
    UINavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:tourNav];
    
    [self presentViewController:nav animated:YES completion:^{
    }];
}

- (IBAction)clickDg:(UIButton *)sender {
    ShoppersViewController *shoppers = [self.storyboard instantiateViewControllerWithIdentifier:@"shoppers"];
    BaseNavigationController *nav  =[[BaseNavigationController alloc]initWithRootViewController:shoppers];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)clickYx:(UIButton *)sender {
    PianoislandViewController *piano = [self.storyboard instantiateViewControllerWithIdentifier:@"Piano"];
    BaseNavigationController *nav  =[[BaseNavigationController alloc]initWithRootViewController:piano];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)clickHd:(UIButton *)sender {
    
    TourActivity *tourAct = [self.storyboard instantiateViewControllerWithIdentifier:@"activity"];
    UINavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:tourAct];
    [self presentViewController:nav animated:YES completion:^{
    }];
}


- (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    [tableView setTableHeaderView:view];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (_dataArr.count == 0) {
        self.moreTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    else
    {
        self.moreTabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"more" forIndexPath:indexPath];
    cell.imgV.image = [UIImage imageNamed:_dataArr[indexPath.row][@"image"]];
    cell.titleLabel.text = _dataArr[indexPath.row][@"title"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        
    }
    else if (indexPath.row == 1)
    {
        PhotoViewController * photo = [self.storyboard instantiateViewControllerWithIdentifier:@"photo"];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:photo];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else if (indexPath.row == 2)
    {
        MassageViewController *massage = [self.storyboard instantiateViewControllerWithIdentifier:@"massage"];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:massage];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
    else if (indexPath.row == 3)
    {
        
    }
    else if (indexPath.row == 4)
    {
        
    }
    else if (indexPath.row == 5)
    {
        
    }
    else if (indexPath.row == 6)
    {
        
    }
}




/**  iBeaconSDK deleget  **/
#pragma mark - ESTBeaconManager delegate

- (void)beaconManager:(id)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    /*
     UIAlertView* errorView = [[UIAlertView alloc] initWithTitle:@"Ranging error"
     message:error.localizedDescription
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
     [errorView show];
     */
}

- (void)beaconManager:(id)manager monitoringDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    /*
     UIAlertView* errorView = [[UIAlertView alloc] initWithTitle:@"Monitoring error"
     message:error.localizedDescription
     delegate:nil
     cancelButtonTitle:@"OK"
     otherButtonTitles:nil];
     
     [errorView show];
     */
}

- (void)beaconManager:(id)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region
{
    //    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    //    NSString *atBackground = [userdefaults objectForKey:@"atBackground"];
    
    self.beaconsArray = beacons;
    if(beacons.count>0){
        float dictance=1000;
        for (int i=0;i<beacons.count;i++) {
            id beacon = beacons[i];
            if([beacon isKindOfClass:[ESTBeacon class]]){
                ESTBeacon *eBeacon = (ESTBeacon *)beacon;
                if(dictance>eBeacon.distance.floatValue){
                    dictance = eBeacon.distance.floatValue;
                    NSLog(@"最近基站的距离%.2f",dictance);
                    majorStr =[NSString stringWithFormat:@"%@",eBeacon.major];
                }
            }
        }
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setValue:majorStr forKey:@"major"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PlaySpeech" object:dic];
    }
}
/**  iBeaconSDK deleget  **/

/**
 *  提示打开蓝牙警示框代理方法
 */
-(void)centralManagerDidUpdateState:(CBCentralManager *)central

{
    
    switch (central.state) {
            
        case CBCentralManagerStatePoweredOn:
            
            NSLog(@"蓝牙已打开,请扫描外设");
            
            break;
            
        case CBCentralManagerStatePoweredOff:
            
            NSLog(@"蓝牙关闭...");
            
            
            break;
            
        default:
            
            break;
            
    }
    
}

@end
