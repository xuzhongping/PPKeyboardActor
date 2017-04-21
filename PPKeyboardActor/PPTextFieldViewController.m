//
//  PPTextFieldViewController.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPTextFieldViewController.h"
#import <Masonry/Masonry.h>
#import "PPTableViewCell.h"
#import "PPKeyboardActor.h"

@interface PPTextFieldViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *fieldTableView;
@property (nonatomic, strong) PPKeyboardActor *actor;
@end

@implementation PPTextFieldViewController

- (void)addSubviews{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.fieldTableView];
    [self.fieldTableView registerClass:[PPTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.actor = [PPKeyboardActor keyboadWithActorView:self.view];
}
- (void)defineLayouts{
    
    [self.fieldTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell bindStr:[NSString stringWithFormat:@"行%ld",indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - getter & setter methods
- (UITableView *)fieldTableView{
    if (!_fieldTableView) {
        _fieldTableView = [[UITableView alloc]init];
        _fieldTableView.tableFooterView = [UIView new];
        _fieldTableView.dataSource = self;
        _fieldTableView.delegate = self;
        [_fieldTableView setBackgroundColor:[UIColor whiteColor]];
    }
    return _fieldTableView;
}
- (void)dealloc{
    
}
@end
