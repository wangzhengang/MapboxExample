//
//  CustomeAnnotationCalloutViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "CustomeAnnotationCalloutViewController.h"
#import <Mapbox/Mapbox.h>
#import "CustomeMapViewCalloutView.h"

@interface CustomeAnnotationCalloutViewController ()<MGLMapViewDelegate>
@property (nonatomic, strong) MGLMapView *mapView;
@property (nonatomic, copy) NSArray *annotationsArray;

@end

@implementation CustomeAnnotationCalloutViewController


- (void)dealloc {
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
}


- (MGLMapView *)mapView {
    if (_mapView == nil) {
        //设置地图的 frame 和 地图个性化样式
        _mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:[NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"]];
        _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //设置地图默认显示的地点和缩放等级
        [_mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.980528, 116.306745) zoomLevel:15 animated:NO];
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

- (NSArray *)annotationsArray {
    if (_annotationsArray == nil) {
        CLLocationCoordinate2D coords[2];
        coords[0] = CLLocationCoordinate2DMake(39.980528, 116.306745);
        coords[1] = CLLocationCoordinate2DMake(40.000, 116.306745);
        NSMutableArray *pointsArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 2; ++i) {
            MGLPointAnnotation *pointAnnotation = [[MGLPointAnnotation alloc] init];
            pointAnnotation.coordinate  = coords[i];
            pointAnnotation.title       = [NSString stringWithFormat:@"title：%ld", (long)i];
            pointAnnotation.subtitle    = [NSString stringWithFormat:@"subtitle: %ld%ld%ld", (long)i,(long)i,(long)i];
            [pointsArray addObject:pointAnnotation];
        }
        _annotationsArray = [pointsArray copy];
    }
    return _annotationsArray;
}


#pragma mark MGLMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MGLMapView *)mapView {
    ///地图加载完成时加载大头针
    [mapView addAnnotations:self.annotationsArray];
}

- (MGLAnnotationView *)mapView:(MGLMapView *)mapView viewForAnnotation:(id<MGLAnnotation>)annotation {
    if (![annotation isKindOfClass:[MGLPointAnnotation class]]) {
        return nil;
    }
    MGLAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MGLAnnotationView"];
    if (annotationView == nil) {
        annotationView = [[MGLAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MGLAnnotationView"];
        [annotationView setFrame:CGRectMake(0, 0, 40, 40)];
        [annotationView setBackgroundColor:[UIColor redColor]];
        annotationView.layer.cornerRadius = 20.f;
        annotationView.layer.masksToBounds= YES;
        annotationView.layer.borderColor  = [UIColor whiteColor].CGColor;
        annotationView.layer.borderWidth  = 5.f;
    }
    return annotationView;
}

///是否显示气泡
-(BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id<MGLAnnotation>)annotation {
    return YES;
}
///完成加载大头针
- (void)mapView:(MGLMapView *)mapView didAddAnnotationViews:(NSArray<MGLAnnotationView *> *)annotationViews {
    [mapView showAnnotations:self.annotationsArray edgePadding:UIEdgeInsetsMake(100, 50, 100, 50) animated:YES];
}

///加载定义callout view
- (id<MGLCalloutView>)mapView:(MGLMapView *)mapView calloutViewForAnnotation:(id<MGLAnnotation>)annotation {
    CustomeMapViewCalloutView *calloutView = [[CustomeMapViewCalloutView alloc] init];
    calloutView.representedObject = annotation;
    return calloutView;
}

///气泡点击事件
- (void)mapView:(MGLMapView *)mapView tapOnCalloutForAnnotation:(id<MGLAnnotation>)annotation {
    NSLog(@"点击了气泡: %@", annotation);
    [mapView deselectAnnotation:annotation animated:YES];
    
    [self showAlertControllerWithViewContorller:self title:@"点击了气泡" message:nil leftButtonTitle:nil rightButtonTitle:@"确定"];
}


#pragma mark - 警告框
- (void)showAlertControllerWithViewContorller:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message leftButtonTitle:(NSString *)leftBtnTitle rightButtonTitle:(NSString *)rightBtnTitle {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (leftBtnTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:leftBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
    }
    if (rightBtnTitle) {
        [alert addAction:[UIAlertAction actionWithTitle:rightBtnTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
    }
    [viewController presentViewController:alert animated:YES completion:nil];
}


@end
