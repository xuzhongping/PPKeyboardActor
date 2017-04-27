//
//  PPInputViewSort.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/26.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPInputViewSort.h"

@implementation PPInputViewSort
static id _instance;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)defaultSort
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

#pragma mark - getter & setter methods
- (NSMutableArray *)inputViews{
    if (!_inputViews) {
        _inputViews = @[].mutableCopy;
    }
    return _inputViews;
}
@end
