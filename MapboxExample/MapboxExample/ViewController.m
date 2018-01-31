//
//  ViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "ViewController.h"
#import "LoadMapViewController.h"
#import "LoadMutableStyleMapViewController.h"
#import "AnnotationCalloutTableViewController.h"
#import "LinePolygonMapboxViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *cellNameArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Mapbox";
    
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableivew
- (NSArray *)cellNameArray {
    if (_cellNameArray == nil) {
        _cellNameArray = @[@"加载地图", @"多种地图样式", @"大头针和气泡", @"线段和多边形"];
    }
    return _cellNameArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

//UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self p_unitiveLoadTableViewCell:@"MapboxTableViewCell" tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.cellNameArray[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            LoadMapViewController *loadMapVC = [[LoadMapViewController alloc] init];
            [self.navigationController pushViewController:loadMapVC animated:YES];
            break;
        }
        case 1: {
            LoadMutableStyleMapViewController *loadMutableMapVC = [[LoadMutableStyleMapViewController alloc] init];
            [self.navigationController pushViewController:loadMutableMapVC animated:YES];
            break;
        }
        case 2: {
            AnnotationCalloutTableViewController *annotationCalloutTVC = [[AnnotationCalloutTableViewController alloc] init];
            [self.navigationController pushViewController:annotationCalloutTVC animated:YES];
            break;
        }
        case 3: {
            LinePolygonMapboxViewController *linePolygonVC = [[LinePolygonMapboxViewController alloc] init];
            [self.navigationController pushViewController:linePolygonVC animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark - cell 相关
- (UITableViewCell *)p_unitiveLoadTableViewCell:(NSString *)inden tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *indentifier = inden;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inden];
    }
    return cell;
}






@end
