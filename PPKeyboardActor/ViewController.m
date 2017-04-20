//
//  ViewController.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "PPTextFieldViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UITableViewCell *chartCell;
@end

@implementation ViewController

- (void)addSubviews{
    [self.view addSubview:self.mainTableView];
}
- (void)defineLayouts{
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 ) {
        PPTextFieldViewController *textVc = [[PPTextFieldViewController alloc]init];
        [self.navigationController pushViewController:textVc animated:YES];
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
            cell = self.chartCell;
            break;
            
        default:
            break;
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
#pragma mark - getter & setter methods
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
    }
    return _mainTableView;
}
- (UITableViewCell *)chartCell{
    if (!_chartCell) {
        _chartCell = [[UITableViewCell alloc]init];
        [_chartCell.textLabel setText:@"测试UITextField弹起"];
    }
    return _chartCell;
}

@end
