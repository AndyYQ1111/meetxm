//
//  HomePage.h
//  
//
//  Created by 岳青山 on 15/5/3.
//
//

#import <UIKit/UIKit.h>
/**
 iBeaconSDK扫描基站需要导入的头文件
 */
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "ESTTriggerManager.h"
#import "ESTBeaconManager.h"
#import "ESTBeaconDefinitions.h"
#import "ESTNearable.h"
#import "ESTNearableManager.h"
#import "ESTNearableDefinitions.h"
#import "ESTBeaconVO.h"
#import "ESTBulkUpdater.h"
#import "ESTBeaconManager.h"
#import "ESTBeaconRegion.h"
/**
 iBeaconSDK扫描基站需要导入的头文件
 */

@interface HomePage : UIViewController<UITableViewDataSource,UITableViewDelegate,ESTBeaconManagerDelegate,CBCentralManagerDelegate>
{
    __weak IBOutlet UIView *moreView;
    __weak IBOutlet UIView *homePageView;
    
    //扫描到的基站的最近距离
    NSString *majorStr;
    
}
/***********iBeaconSDK*************/
@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *region01;
@property (nonatomic, strong) NSArray *beaconsArray;
/***********iBeaconSDK*************/

@property(nonatomic,strong)CBCentralManager *manager;

@property (weak, nonatomic) IBOutlet UITableView *moreTabView;
@property(nonatomic,strong) NSArray * dataArr;

- (IBAction)clickRight:(UIButton *)sender;
- (IBAction)clickDy:(UIButton *)sender;
- (IBAction)clickDl:(UIButton *)sender;
- (IBAction)clickDh:(UIButton *)sender;
- (IBAction)clickDg:(UIButton *)sender;
- (IBAction)clickYx:(UIButton *)sender;
- (IBAction)clickHd:(UIButton *)sender;
- (IBAction)clickLeft:(UIButton *)sender;

@end
