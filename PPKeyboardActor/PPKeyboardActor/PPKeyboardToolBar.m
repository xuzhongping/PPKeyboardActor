//
//  PPKeyboardToolBar.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/21.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPKeyboardToolBar.h"
#import <Masonry.h>
#import "PPInputViewSort.h"

@interface PPKeyboardToolBar ()
@property (nonatomic, strong) UIButton  *lastBtn;
@property (nonatomic, strong) UIButton  *nextBtn;
@property (nonatomic, strong) UILabel   *infoLabel;
@end
@implementation PPKeyboardToolBar
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self defineLayouts];
        [self handleEvent];
    }
    return self;
}

- (void)addSubviews{
    self.backgroundColor = UIColor(245, 245, 245);
    [self addSubview:self.lastBtn];
    [self addSubview:self.nextBtn];
    [self addSubview:self.infoLabel];
}
- (void)defineLayouts{
    [self.lastBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10.0);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_offset(30);
        make.height.mas_offset(30);
    }];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lastBtn.mas_right).offset(10.0);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.top.equalTo(self.nextBtn.mas_top);
        make.bottom.equalTo(self.nextBtn.mas_bottom);
        make.left.equalTo(self.nextBtn.mas_right).offset(10.0);
    }];
}

- (void)handleEvent{
    [self.nextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextClick{
    UIView *responder = [self getFirstResponder];
    UITableView *sourceTableView = (UITableView *)[self fetchTableView:responder];
    NSArray *visibleCells = [sourceTableView visibleCells];
    [[PPInputViewSort defaultSort].inputViews removeAllObjects];
    for (UITableViewCell *cell in visibleCells) {
        UITextField *textField = (UITextField *)[self fetchInputViewWithSuperView:cell];
        if (textField) {
            [[PPInputViewSort defaultSort].inputViews addObject:textField];
        }
    }
    NSInteger index = [[PPInputViewSort defaultSort].inputViews indexOfObject:responder];
    if (index == 0) {
        [self.lastBtn setEnabled:NO];
    }else {
        [self.lastBtn setEnabled:YES];
    }
    if (index == [PPInputViewSort defaultSort].inputViews.count - 1) {
        index = [PPInputViewSort defaultSort].inputViews.count - 1;
    }else {
        index += 1;
    }
    UIView<UITextInput>* inputView = [PPInputViewSort defaultSort].inputViews[index];
    [responder resignFirstResponder];
    [inputView becomeFirstResponder];
}

- (UIView *)fetchTableView:(UIView *)responderView{
    if ([responderView isKindOfClass:[UITableView class]]) {
        return responderView;
    }else {
       return [self fetchTableView:responderView.superview];
    }
}

- (UIView *)fetchInputViewWithSuperView:(UIView *)superView{
    for (UIView *subView in superView.subviews.firstObject.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            return subView;
        }
    }
    return nil;
}
- (UIView *)getFirstResponder{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return firstResponder;
}
#pragma mark - getter & setter methods
- (UIButton *)lastBtn{
    if (!_lastBtn) {
        _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastBtn setTitle:@"▲" forState:UIControlStateNormal];
        [_lastBtn setTitleColor:UIColor(135, 135, 135) forState:UIControlStateNormal];
        [_lastBtn setTitleColor:UIColor(170, 170, 170) forState:UIControlStateDisabled];
    }
    return _lastBtn;
}
- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"▼" forState:UIControlStateNormal];
        [_nextBtn setTitleColor:UIColor(135, 135, 135) forState:UIControlStateNormal];
        [_nextBtn setTitleColor:UIColor(170, 170, 170) forState:UIControlStateDisabled];
    }
    return _nextBtn;
}
- (UILabel *)infoLabel{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]init];
        [_infoLabel setTextColor:UIColor(135, 135, 135)];
        [_infoLabel setTextAlignment:NSTextAlignmentCenter];
        [_infoLabel setText:@"请输入文字"];
    }
    return _infoLabel;
}
@end
