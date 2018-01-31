//
//  LoadMutableStyleMapViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "LoadMutableStyleMapViewController.h"
#import <Mapbox/Mapbox.h>
#import "LoadMutableStyleMapCollectionCell.h"


@interface LoadMutableStyleMapViewController ()<MGLMapViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) MGLMapView *mapView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *styleArray;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@end

@implementation LoadMutableStyleMapViewController

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
    _collectionView = nil;
    
    [_mapView removeFromSuperview];
    _mapView.delegate = nil;
    _mapView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"各种地图样式";
    
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.collectionView];
}


#pragma mark - 地图相关
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

#pragma mark - collection view 相关
- (NSArray *)styleArray {
    if (_styleArray == nil) {
        _styleArray = @[ @"streets-v10",
                         @"outdoors-v10",
                         @"light-v9",
                         @"dark-v9",
                         @"satellite-v9",
                         @"satellite-streets-v10",
                         @"navigation-preview-day-v2",
                         @"navigation-preview-night-v2",
                         @"navigation-guidance-day-v2",
                         @"navigation-guidance-night-v2"
                         ];
    }
    return _styleArray;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing       = 5;
        flowLayout.minimumInteritemSpacing  = 5;
        flowLayout.itemSize         = CGSizeMake(100, 60);
        flowLayout.sectionInset     = UIEdgeInsetsMake(0, 5, 0, 5);
        flowLayout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 69, self.view.bounds.size.width, 60) collectionViewLayout:flowLayout];
        _collectionView.dataSource      = self;
        _collectionView.delegate        = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"LoadMutableStyleMapCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"LoadMutableStyleMapCollectionCell"];
    }
    return _collectionView;
}

///UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.styleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"LoadMutableStyleMapCollectionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    LoadMutableStyleMapCollectionCell *tCell = (LoadMutableStyleMapCollectionCell *)cell;
    tCell.titleLab.text = self.styleArray[indexPath.row];
    if (self.selectedIndexPath.row == indexPath.row) {
        tCell.titleLab.backgroundColor = [UIColor grayColor];
    } else {
        tCell.titleLab.backgroundColor = [UIColor whiteColor];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [collectionView reloadData];
    [self.mapView setStyleURL:[NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"]];
}






@end
