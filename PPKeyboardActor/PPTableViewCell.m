//
//  PPTableViewCell.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPTableViewCell.h"
#import <Masonry/Masonry.h>
#import "PPKeyboardToolBar.h"

@interface PPTableViewCell ()
@property (nonatomic, strong) UILabel *sortNumLabel;
@property (nonatomic, strong) UITextField *textField;
@end
@implementation PPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self defineLayouts];
    }
    return self;
}

- (void)addSubviews{
    [self.contentView addSubview:self.sortNumLabel];
    [self.contentView addSubview:self.textField];
}

- (void)defineLayouts{
    [self.sortNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(50);
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sortNumLabel.mas_right).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.top.equalTo(self.sortNumLabel.mas_top);
        make.bottom.equalTo(self.sortNumLabel.mas_bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void)bindStr:(NSString *)str{
    [self.sortNumLabel setText:str];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.textField setText:NSStringFromCGRect(self.frame)];
}

#pragma mark - getter & setter methods
- (UILabel *)sortNumLabel{
    if (!_sortNumLabel) {
        _sortNumLabel = [[UILabel alloc]init];
    }
    return _sortNumLabel;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        [_textField setPlaceholder:@"请输入"];

    }
    return _textField;
}
@end
