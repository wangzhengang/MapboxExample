//
//  AnnotationCalloutTableViewController.m
//  MapboxExample
//
//  Created by iron on 2018/1/30.
//  Copyright © 2018年 wangzhengang. All rights reserved.
//

#import "AnnotationCalloutTableViewController.h"
#import "DefaultAnnotationCalloutViewController.h"
#import "CustomeAnnotationCalloutViewController.h"

@interface AnnotationCalloutTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *cellNameArray;
@end

@implementation AnnotationCalloutTableViewController

- (void)dealloc {
    self.tableView.delegate     = nil;
    self.tableView.dataSource   = nil;
    self.tableView              = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"大头针和气泡";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)cellNameArray {
    if (_cellNameArray == nil) {
        _cellNameArray = @[@"系统默认的大头针和气泡", @"自定义的大头针和气泡"];
    }
    return _cellNameArray;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnnotationCalloutTableViewControllerCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AnnotationCalloutTableViewControllerCell"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    cell.textLabel.text = self.cellNameArray[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            DefaultAnnotationCalloutViewController *defaultVC = [[DefaultAnnotationCalloutViewController alloc] init];
            [self.navigationController pushViewController:defaultVC animated:YES];
            break;
        }
        case 1: {
            CustomeAnnotationCalloutViewController *customeVC = [[CustomeAnnotationCalloutViewController alloc] init];
            [self.navigationController pushViewController:customeVC animated:YES];
            break;
        }
        default: break;
    }
}








@end
