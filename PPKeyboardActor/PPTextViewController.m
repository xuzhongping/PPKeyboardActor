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

@interface PPTextViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *firstTextView;
@property (nonatomic, strong) UITextView *secondTextView;
@property (nonatomic, strong) UITextField *testField;
@property (nonatomic, strong) PPKeyboardActor *actor;
@end

@implementation PPTextViewController

- (void)addSubviews{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.firstTextView];
    [self.view addSubview:self.secondTextView];
    [self.secondTextView addSubview:self.testField];
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
    [self.testField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.secondTextView.mas_centerX);
        make.centerY.equalTo(self.secondTextView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark - getter & setter methods
- (UITextView *)firstTextView{
    if (!_firstTextView) {
        _firstTextView = [[UITextView alloc]init];
        _firstTextView.backgroundColor = [UIColor redColor];
        _firstTextView.delegate = self;
    }
    return _firstTextView;
}

- (UITextView *)secondTextView{
    if (!_secondTextView) {
        _secondTextView = [[UITextView alloc]init];
        _secondTextView.backgroundColor = [UIColor yellowColor];
        _secondTextView.delegate = self;
    }
    return _secondTextView;
}
- (UITextField *)testField{
    if (!_testField) {
        _testField = [[UITextField alloc]init];
        _testField.backgroundColor = [UIColor blueColor];
    }
    return _testField;
}
@end
