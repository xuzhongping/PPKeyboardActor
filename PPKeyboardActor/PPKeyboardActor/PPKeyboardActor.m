//
//  PPKeyboardActor.m
//  PPKeyboardActor
//
//  Created by 徐仲平 on 2017/4/20.
//  Copyright © 2017年 徐仲平. All rights reserved.
//

#import "PPKeyboardActor.h"

@interface PPKeyboardActor ()
@property (nonatomic, strong) UIView *actorView;
@end
@implementation PPKeyboardActor
+ (instancetype)keyboadWithActorView:(UIView *)actorView{
    PPKeyboardActor *actor = [[self alloc]init];
    [actor setActorView:actorView];
    return actor;
}
- (instancetype)init{
    if (self = [super init]) {
        [self acceptNotification];
    }
    return self;
}

- (void)acceptNotification{
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary *info = [note userInfo];
        CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:duration animations:^{
            [_actorView setTransform:CGAffineTransformIdentity];
        }];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSDictionary *info = [note userInfo];
        CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
        UIView *firstResponder = [self getFirstResponder];
        UITableViewCell *tCell = [self getSourceTableViewCell:firstResponder];
        UICollectionViewCell *cCell = [self getSourceCollectionViewCell:firstResponder];
        if (tCell) {
            id orginView = tCell.superview.superview;
            if ([orginView isKindOfClass:[UITableView class]]) {
                UITableView *tableView = orginView;
                CGFloat responderForScreen = tCell.frame.origin.y + CGRectGetMaxY(firstResponder.frame) - tableView.contentOffset.y;
                CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - responderForScreen;
                if (responderSpaceKeyboard < tCell.frame.size.height + 10) {
                    NSIndexPath *indexPath = [tableView indexPathForCell:tCell];
                    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
                    CGFloat offsetY = ABS(responderSpaceKeyboard) + 80.0;
                    [UIView animateWithDuration:duration animations:^{
                        [_actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
                    }];
                }else {
                    [UIView animateWithDuration:duration animations:^{
                        [_actorView setTransform:CGAffineTransformIdentity];
                    }];
                }
            }else
            {
                return ;
            }
        }else
            if (cCell){
        id orginView = tCell.superview.superview;
        if ([orginView isKindOfClass:[UICollectionView class]]) {
            UICollectionView *collectionView = orginView;
            CGFloat responderForScreen = tCell.frame.origin.y + CGRectGetMaxY(firstResponder.frame) - collectionView.contentOffset.y;
            CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - responderForScreen;
            if (responderSpaceKeyboard < cCell.frame.size.height + 10) {
                NSIndexPath *indexPath = [collectionView indexPathForCell:cCell];
                [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
                CGFloat offsetY = ABS(responderSpaceKeyboard) + 80.0;
                [UIView animateWithDuration:duration animations:^{
                    [_actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
                }];
            }else {
                [UIView animateWithDuration:duration animations:^{
                    [_actorView setTransform:CGAffineTransformIdentity];
                }];
            }
        }else
        {
            return ;
        }
        }else {
            CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - CGRectGetMaxY(firstResponder.frame);
            if (responderSpaceKeyboard < 50) {
                CGFloat offsetY = ABS(responderSpaceKeyboard) + 80.0;
                [UIView animateWithDuration:duration animations:^{
                    [_actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
                }];
            }else {
                [UIView animateWithDuration:duration animations:^{
                    [_actorView setTransform:CGAffineTransformIdentity];
                }];
            }
            
        }
    }];
}

#pragma mark - Get

- (UIView *)getFirstResponder{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return firstResponder;
}
- (UITableViewCell *)getSourceTableViewCell:(UIView *)view{
    if ([view.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)view.superview;
    }else{
        if (view.superview) {
            return [self getSourceTableViewCell:view.superview];
        }else {
            return nil;
        }
    }
    return nil;
}
- (UICollectionViewCell *)getSourceCollectionViewCell:(UIView *)view{
    if ([view.superview isKindOfClass:[UICollectionViewCell class]]) {
        return (UICollectionViewCell *)view.superview;
    }else{
        if (view.superview) {
            return [self getSourceCollectionViewCell:view.superview];
        }else {
            return nil;
        }
    }
    return nil;
}
@end
