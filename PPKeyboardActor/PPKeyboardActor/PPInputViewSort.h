//
//  PPInputViewSort.h
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/26.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPInputViewSort : NSObject
@property (nonatomic, strong) NSMutableArray *inputViews;

+ (instancetype)defaultSort;
@end
