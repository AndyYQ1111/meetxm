//
//  TourRoute.m
//  meetxm
//
//  Created by 岳青山 on 15/5/3.
//  Copyright (c) 2015年 岳青山. All rights reserved.
//

#import "TourRoute.h"
#import "TourRouteCell.h"
#import "BroadcastSpeech.h"
#import <AVFoundation/AVFoundation.h>
#import "MJAudioTool.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TourRoute ()
@property (strong, nonatomic) NSArray *musics;
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSDictionary *listValus;
@end

@implementation TourRoute
-(NSArray *)musics
{
    if (!_musics) {
        NSString *fielPath = [[NSBundle mainBundle] pathForResource:@"Audio" ofType:@"plist"];
        _musics= [NSArray arrayWithContentsOfFile:fielPath];
    }
    return _musics;
}

-(NSDictionary *)listValus
{
    if (!_listValus) {
        _listValus = @{@"1.智慧导览.m4a":@"主入口进门后引导至右侧引导台领取导览设备，收听整体介绍",@"2引导台.m4a":@"厦门旅游集散服务中心是由政府主导的，具有公信力的旅游综合服务平台，被评为省市为民办实事重点工程。中心以旅游电子商务应用为基础，整合旅游咨询、预订、营销等传统服务功能，并以“厦门旅游集散服务”特许经营权，负责全市各服务网点的规划、布局、建设与运营。中心的主要功能包括：公共服务、旅游订制、营销推广、行业服务、信息指挥、智慧旅游、区域联动等；中心成立的愿景，是为了提升厦门城市旅游的公共服务水平，促进散客旅游有序、均衡、高效地发展，构建一个具有公信力的、线上线下一体化的、较为完善的旅游公共服务体系。",@"3旅游自助服务区.m4a":@"您现在所在区域摆放的旅游自助多功能信息屏集景观性、功能性、公益性于一体，具备厦门旅游信息发布、信息检索查询、旅游攻略线路、在线照片冲印等互动功能，为来厦的国内外游客以及本地居民提供专业、及时、准确、权威的旅游公共信息服务。",@"4.3D互动区.m4a":@"您现在所见的是通过多媒体互动信息墙、3D投影等设备为游客提供视觉、听觉、触觉体感互动的3D景区推介区。  通过厦门市各大景区的3D虚拟影像投影及配套成像，给游客以三维立体的空间感觉，使观者犹如身在其中，自由游览，了解景点风光。",@"5.应用展示区.m4a":@"您现在看到的互动触摸屏组成展示了包括旅游集散服务中心资讯网站、智慧导览手机APP客户端、微信公众平台在内的应用交互。",@"6.旅游智慧屏.m4a":@"您现在看到的是旅游智慧信息触摸屏，设备同智慧导览APP客户端保持联动，手机客户端上传景区拍摄照片生成的二维码地址，通过电子信息触摸屏上的二维码识别功能实现照片的快速冲印。",@"7综合服务区.m4a":@"游客接待服务区由前台客服人员提供面对面的温馨对客服务，为客人提供咨询、预定、邮政、失物招领、便民租借等综合服务。",@"8信息播放屏.m4a":@"【信息播放屏】实时播放当前旅游产品信息及旅游宣传视频，帮忙游客、市民更进一步了解旅游信息化、智慧化为游客带来的便携帮助。",@"9行李寄存区.m4a":@"配备自助行李寄存柜，游客可以根据需要自行操作，实现小件行李寄存。未来支持通过智慧导览APP联动，在移动终端实现寄存柜的开关控制。",@"10医务室.m4a":@"以接待大厅为中心开展医疗急救服务，做到文明、尽职、热情、便民。主要提供普通外伤包扎等工作，确保以高度的责任心：及时、严肃、快捷的开展医疗急救服务，对重症病人予以转诊。",@"11伴手礼超市.m4a":@"售卖闽台特色产品，为旅客提供特色旅游商品便捷的订购，把当地的味道轻松带回家，轻松旅行。",@"12多功能厅.m4a":@"场地总面积175平方米，设置72个会议座位，提供投影仪、音响设施等会议所需设备。可作为会议厅，视频会议厅，报告厅，学术讨论厅，培训厅等。",@"13机房.m4a":@"您所在的区域是厦门旅游信息监控平台，平台集合了",@"14呼叫中心.m4a":@"厦门旅游集散服务中心呼叫系统集成了呼叫排队、智能路由、自动语音交互服务、人工电话服务及录音质检系统等全面的呼叫中心系统平台功能；系统以最新通讯技术服务为基础，以游客咨询、投诉、便民服务为中心, 是一个即时互动的综合性信息平台，肩负着企业内外部沟通桥梁的使命，在中心日常管理活动中发挥重要的作用。",@"15预警中心.m4a":@"通过市级各个信息归口单位与厦门旅游集散服务中心共同负责，并厦门市旅游局信息中心联网，实施资源共享。中心通过厦门旅游统一的物联网接入管理平台，实现旅游信息数据跨区域、跨时空的完整汇聚，最终转换为可视化、空间化、实时化数据（如景区热力图、当前客流量、景区路况、视频信息、空气质量等）对外发布和引导游客。厦门市内外普通的旅游者可以通过四种渠道咨询和了解相关旅游信息：旅游呼叫热线、互联网站、手机移动终端和旅游集散中心各网点。此外，预警中心还将与厦门旅游紧急救援中心，联合公安、交通等相关职能部门，建立厦门假日旅游的预警快速反应机制。",@"16办公区.m4a":@"厦门旅游集散中心员工、福建霞客行信息科技有限公司办公区；办公区内特别设置员工休息区，提供冰箱、微波炉、餐桌等设施设备，方便员工午餐、休息，让他们在忙碌的工作之余有个放松心情的地方,体现公司人性化管理,增加员工归属感。",@"17游客上车区.m4a":@"游客通过检票闸口，途经特别铺设遮阳顶棚的通道直达上车点，为特殊天气出行的游客提供贴心、细致的服务，免去上下车风吹日晒雨淋的烦恼。",@"18自行车租赁.m4a":@"环岛路观光自行车观音山站地处观音山梦幻海岸休闲区，为游客提供便利的双人或三人自行车租赁业务，游客可从观音山至胡里山全程14公里的自行车骑行车道上骑行，骑行途经观音山沙雕公园、奥林匹克博物馆、会展中心、椰风寨、音乐广场、珍珠湾等厦门新二十名景。",@"19婚纱摄影园.m4a":@"蓝波湾婚纱摄影园创立于2014年，园区摄影基地提供主体实景、欧韩街景、沙滩、海景、马场、飞机峰100多个内外景主体拍照资源，同时配套提供对应主体礼服、化妆品、内外景更衣区、休息区、影视厅、接送客车等客户所需服务，力争为客户打造最优质的服务体验。"};
    }
    return _listValus;
}

-(NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"智慧导览",@"引导台",@"旅游自助服务区",@"3D互动区",@"应用展示区",@"旅游智慧屏",@"综合服务区 ",@"信息播放屏",@"行李寄放区",@"医务室",@"伴手礼超市",@"多功能厅",@"机房",@"呼叫中心",@"预警中心",@"办公区",@"游客上车区",@"自行车租赁",@"婚纱摄影园"];
    }
    return _titles;
}

- (void)viewDidLoad {
    [super loadBarButton:2];
    [super viewDidLoad];
    
    self.title = @"经典线路";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.musics.count;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CustomCellIdentifier = @"TourRouteCell";
    TourRouteCell *cell;
    cell=(TourRouteCell*)[tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"TourRouteCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.title.text = self.titles[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      [MJAudioTool playMusic:self.musics[indexPath.row]];
    
    alertView.frame = CGRectMake((ScreenWidth-200)/2, (ScreenHeight-196)/2, 200, 196);
    [self.view addSubview:alertView];
    
    NSString *str = [self.listValus objectForKey:self.musics[indexPath.row]];
    txtWord.text = str;

}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [MJAudioTool stopMusic:self.musics[indexPath.row]];
}

- (IBAction)clickSpeech:(UIButton *)sender {
    

    BroadcastSpeech *BSpeech;
    
    BSpeech = [[BroadcastSpeech alloc] init];
    
    
    [self.navigationController pushViewController:BSpeech animated:YES];
}

- (IBAction)clickClose:(UIButton *)sender {
    [alertView removeFromSuperview];
//    [MJAudioTool stopMusic:self.musics[indexPath.row]];
    
}
@end
