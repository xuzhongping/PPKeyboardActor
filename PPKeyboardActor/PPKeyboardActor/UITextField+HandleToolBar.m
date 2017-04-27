//
//  UITextField+HandleToolBar.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/26.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "UITextField+HandleToolBar.h"
#import "PPKeyboardToolBar.h"
#import "PPInputViewSort.h"

@implementation UITextField (HandleToolBar)

- (instancetype)init{
    if (self = [super init]) {
        [self handleTooBar];
        [[PPInputViewSort defaultSort].inputViews addObject:self];
    }
    return self;
}
- (void)handleTooBar{
    [self setInputAccessoryView:[self toolBar]];
}

- (PPKeyboardToolBar *)toolBar{
    PPKeyboardToolBar *toolBar = [[PPKeyboardToolBar alloc]init];
    toolBar.frame = CGRectMake(0, 0, 0, 40.0);
    return toolBar;
}
@end

@implementation UITextView (HandleToolBar)

- (instancetype)init{
    if (self = [super init]) {
        [self handleTooBar];
        [[PPInputViewSort defaultSort].inputViews addObject:self];
    }
    return self;
}
- (void)handleTooBar{
    [self setInputAccessoryView:[self toolBar]];
}

- (PPKeyboardToolBar *)toolBar{
    PPKeyboardToolBar *toolBar = [[PPKeyboardToolBar alloc]init];
    toolBar.frame = CGRectMake(0, 0, 0, 40.0);
    return toolBar;
}

@end
