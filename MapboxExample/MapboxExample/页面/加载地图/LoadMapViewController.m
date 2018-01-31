//
//  LoadMapViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "LoadMapViewController.h"
#import <Mapbox/Mapbox.h>

@interface LoadMapViewController ()<MGLMapViewDelegate>
@property (nonatomic, strong) MGLMapView *mapView;
@end

@implementation LoadMapViewController

- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"加载地图";
    
    [self.view addSubview:self.mapView];
}

- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:15 animated:YES];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeFollow;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}








@end
