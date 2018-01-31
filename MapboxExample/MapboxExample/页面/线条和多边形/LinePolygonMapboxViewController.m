//
//  LinePolygonMapboxViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "LinePolygonMapboxViewController.h"
#import <Mapbox/Mapbox.h>
#import "MGLShape+PolygonParamer.h"


@interface LinePolygonMapboxViewController ()<MGLMapViewDelegate>
@property (nonatomic, strong) MGLMapView *mapView;

@property (nonatomic, strong) MGLPolyline *blueLine;//蓝色线段

@property (nonatomic, strong) MGLPolyline *strokeLine;//多边形边线
@property (nonatomic, strong) MGLPolygon *polygon;//多边形

@end

@implementation LinePolygonMapboxViewController

- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"线段和多边形";
    
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:8 animated:YES];
        //显示用户位置
        _mapView.showsUserLocation  = YES;
        //定位模式
        _mapView.userTrackingMode   = MGLUserTrackingModeNone;
        //是否倾斜地图
        _mapView.pitchEnabled       = YES;
        //是否旋转地图
        _mapView.rotateEnabled      = NO;
        //代理
        _mapView.delegate           = self;
    }
    return _mapView;
}


- (MGLPolyline *)blueLine {
    if (_blueLine == nil) {
        CLLocationCoordinate2D coords[3];
        coords[0] = CLLocationCoordinate2DMake(27.000, 95.356745);
        coords[1] = CLLocationCoordinate2DMake(20.000, 105.356745);
        coords[2] = CLLocationCoordinate2DMake(27.000, 115.356745);
        
        _blueLine = [MGLPolyline polylineWithCoordinates:coords count:3];
        _blueLine.strokeColor   = [UIColor blueColor];
        _blueLine.strokeWeight  = 3.f;
        _blueLine.fillOpacity   = 0.75f;
        _blueLine.isDash        = NO;
    }
    return _blueLine;
}

- (MGLPolyline *)strokeLine {
    if (_strokeLine == nil) {
        CLLocationCoordinate2D coords[6];
        coords[0] = CLLocationCoordinate2DMake(30.980528, 110.306745);
        coords[2] = CLLocationCoordinate2DMake(30.000, 120.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 120.306745);
        coords[3] = CLLocationCoordinate2DMake(40.000, 110.306745);
        coords[4] = CLLocationCoordinate2DMake(35.000, 95.356745);
        coords[5] = CLLocationCoordinate2DMake(30.980528, 110.306745);;
        _strokeLine = [MGLPolyline polylineWithCoordinates:coords count:6];
        _strokeLine.strokeColor   = [UIColor blackColor];
        _strokeLine.strokeWeight  = 2.f;
        _strokeLine.fillOpacity   = 0.75f;
        _strokeLine.isDash        = YES;
    }
    return _strokeLine;
}

- (MGLPolygon *)polygon {
    if (_polygon == nil) {
        CLLocationCoordinate2D coords[6];
        coords[0] = CLLocationCoordinate2DMake(30.980528, 110.306745);
        coords[2] = CLLocationCoordinate2DMake(30.000, 120.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 120.306745);
        coords[3] = CLLocationCoordinate2DMake(40.000, 110.306745);
        coords[4] = CLLocationCoordinate2DMake(35.000, 95.356745);
        _polygon = [MGLPolygon polygonWithCoordinates:coords count:5];
        _polygon.fillColor   = [UIColor redColor];
        _polygon.strokeColor = [UIColor blueColor];
        _polygon.strokeWeight= 2.f;
        _polygon.fillOpacity = 0.5f;
    }
    return _polygon;
}

#pragma mark MGLMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView {
    ///地图加载完成后绘制 线段 和 多边形
    [mapView addOverlays:@[self.blueLine, self.strokeLine, self.polygon]];
    ///把窗口显示到合适的范围
    [mapView setVisibleCoordinateBounds:self.polygon.overlayBounds edgePadding:UIEdgeInsetsMake(0, 10, 200, 10) animated:YES];
    
//    [mapView setVisibleCoordinateBounds:self.line.overlayBounds edgePadding:UIEdgeInsetsMake(300, 10, 0, 10) animated:YES];
}

- (CGFloat)mapView:(MGLMapView *)mapView alphaForShapeAnnotation:(MGLShape *)annotation {
    ///MGLPolyline 和 MGLPolygon 都执行这个方法
    return annotation.fillOpacity;
}

- (UIColor *)mapView:(MGLMapView *)mapView strokeColorForShapeAnnotation:(MGLShape *)annotation {
    ///MGLPolyline 和 MGLPolygon 都执行这个方法
    if ([@"MGLPolyline" isEqualToString:NSStringFromClass([annotation class])]) {
        
        if (annotation.isDash) {
            MGLShapeSource *shapeSource = [self addSourceWithShape:annotation];
            [self.mapView.style addSource:shapeSource];
            MGLStyleLayer *styleLayer = [self dashedLineWithStyle:shapeSource shape:annotation lineDashPattern:@[@2.f, @1.f] lineCap:MGLLineCapButt lineColor:[UIColor blackColor] lineWidth:@2];
            [self.mapView.style addLayer:styleLayer];
            return [UIColor clearColor];
        } else {
            return annotation.strokeColor;
        }
    } else if ([@"MGLPolygon" isEqualToString:NSStringFromClass([annotation class])]) {
        
        return annotation.strokeColor;
    }
    return annotation.strokeColor;
}

- (UIColor *)mapView:(MGLMapView *)mapView fillColorForPolygonAnnotation:(MGLPolygon *)annotation {
    /// MGLPolygon 执行这个方法， MGLPolyline 不执行这个方法
    return annotation.fillColor;
}

- (CGFloat)mapView:(MGLMapView *)mapView lineWidthForPolylineAnnotation:(MGLPolyline *)annotation {
    ///MGLPolyline 执行这个方法, MGLPolygon 不执行
    return annotation.strokeWeight;
}

#pragma mark 画虚线
- (MGLShapeSource *)addSourceWithShape:(MGLShape *)shape {
    return [[MGLShapeSource alloc] initWithIdentifier:@"DashLines" shape:shape options:nil];
}

- (MGLStyleLayer *)dashedLineWithStyle:(MGLShapeSource *)shapeSource shape:(MGLShape *)shape lineDashPattern:(NSArray<NSNumber *> *)lineDashPattern lineCap:(MGLLineCap)cap lineColor:(UIColor *)lineColor lineWidth:(NSNumber *)lineWidth {
    MGLLineStyleLayer *lineStyleLayer = [[MGLLineStyleLayer alloc] initWithIdentifier:@"DashLines" source:shapeSource];
    //线段模型
    lineStyleLayer.lineDashPattern = [MGLStyleValue valueWithRawValue:lineDashPattern];
    //线段头部
    lineStyleLayer.lineCap   = [MGLStyleValue valueWithRawValue:[NSNumber numberWithInteger:cap]];
    //线段颜色
    lineStyleLayer.lineColor = [MGLStyleValue valueWithRawValue:lineColor];
    //线段宽度
    lineStyleLayer.lineWidth = [MGLStyleValue valueWithRawValue:lineWidth];
    return lineStyleLayer;
}





@end
