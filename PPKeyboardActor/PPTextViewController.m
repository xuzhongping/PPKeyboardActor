//
//  PPTextViewController.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPTextViewController.h"
#import <Masonry.h>
#import "PPKeyboardActor.h"

@interface PPTextViewController ()
@property (nonatomic, strong) UITextView *firstTextView;
@property (nonatomic, strong) UITextView *secondTextView;
@property (nonatomic, strong) PPKeyboardActor *actor;
@end

@implementation PPTextViewController

- (void)addSubviews{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.firstTextView];
    [self.view addSubview:self.secondTextView];
    self.actor = [PPKeyboardActor keyboadWithActorView:self.view];
}

- (void)defineLayouts{
    [self.firstTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(70);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
    [self.secondTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.firstTextView.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
}

#pragma mark - getter & setter methods
- (UITextView *)firstTextView{
    if (!_firstTextView) {
        _firstTextView = [[UITextView alloc]init];
        _firstTextView.backgroundColor = [UIColor redColor];
    }
    return _firstTextView;
}

- (UITextView *)secondTextView{
    if (!_secondTextView) {
        _secondTextView = [[UITextView alloc]init];
        _secondTextView.backgroundColor = [UIColor yellowColor];
    }
    return _secondTextView;
}
@end
