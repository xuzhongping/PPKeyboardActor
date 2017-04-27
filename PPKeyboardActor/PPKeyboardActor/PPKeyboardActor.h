//
//  PPKeyboardActor.h
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PPInputViewScrollStyle) {
    kPPInputViewScrollStyleNone = 0,
    kPPInputViewScrollStyleAuto,
    kPPInputViewScrollStyleToolBar,
};

@interface PPKeyboardActor : NSObject
+ (instancetype)keyboadWithActorView:(UIView *)actorView;

@property (nonatomic,assign,readwrite)PPInputViewScrollStyle scrollStyle;

@end
