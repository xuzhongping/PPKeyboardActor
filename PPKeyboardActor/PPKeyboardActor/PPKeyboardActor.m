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
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSDictionary *info = [note userInfo];
        CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:duration animations:^{
            [strongSelf.actorView setTransform:CGAffineTransformIdentity];
        }];
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSDictionary *info = [note userInfo];
        
        UIView *firstResponder = [strongSelf getFirstResponder];
        UITableViewCell *tCell = [strongSelf getSourceTableViewCell:firstResponder];
        UICollectionViewCell *cCell = [strongSelf getSourceCollectionViewCell:firstResponder];
        if (tCell) { // if the firstResponder In UITableViewCell
            [strongSelf handleTableViewCellInput:info tableViewCell:tCell responder:firstResponder];
        }else
        if (cCell){ // if the firstResponder In UICollectionView
            [strongSelf handleCollectionViewCellInput:info collectionViewCell:cCell responder:firstResponder];
        }else  // if the firstResponder In UIView
        {
            [strongSelf handleViewInput:info view:firstResponder];
        }
    }];
}


/**
 handle keyboard mask inputView when UITableViewCell
 */
- (void)handleTableViewCellInput:(NSDictionary *)keyboardInfo tableViewCell:(UITableViewCell *)cell responder:(UIView *)responder{
    __weak typeof(self) weakSelf = self;
    CGFloat duration = [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endKeyboardRect = [[keyboardInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    id orginView = cell.superview.superview;
    if ([orginView isKindOfClass:[UITableView class]]) {
        UITableView *tableView = orginView;
        CGFloat responderForScreenY = CGRectGetMaxY(cell.frame) - tableView.contentOffset.y;
        CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - responderForScreenY;
        if (responderSpaceKeyboard < 1.0) {
            CGFloat offsetY = ABS(responderSpaceKeyboard);
            [UIView animateWithDuration:duration animations:^{
             __strong typeof(weakSelf) strongSelf = weakSelf;
                [strongSelf.actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
        }];
        }else {
            [UIView animateWithDuration:duration animations:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                [strongSelf.actorView setTransform:CGAffineTransformIdentity];
            }];
        }
    }else
    {
        return ;
    }
}

/**
 handle keyboard mask inputView when UICollectionViewCell
 */
- (void)handleCollectionViewCellInput:(NSDictionary *)keyboardInfo collectionViewCell:(UICollectionViewCell *)cell responder:(UIView *)responder{
    __weak typeof(self) weakSelf = self;
    CGFloat duration = [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endKeyboardRect = [[keyboardInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    id orginView = cell.superview.superview;
    if ([orginView isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = orginView;
        CGFloat responderForScreen = CGRectGetMaxY(cell.frame) - collectionView.contentOffset.y;
        CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - responderForScreen;
        if (responderSpaceKeyboard < 1.0) {
            CGFloat offsetY = ABS(responderSpaceKeyboard);
            [UIView animateWithDuration:duration animations:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                [strongSelf.actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
            }];
        }else {
            [UIView animateWithDuration:duration animations:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                [strongSelf.actorView setTransform:CGAffineTransformIdentity];
            }];
        }
    }else
    {
        return ;
    }

}

/**
 handle keyboard mask inputView when UIView
 */
- (void)handleViewInput:(NSDictionary *)keyboardInfo view:(UIView *)view{
    __weak typeof(self) weakSelf = self;
    CGFloat duration = [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endKeyboardRect = [[keyboardInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat responderForScreen = CGRectGetMaxY(view.frame) - view.transform.ty;
    CGFloat responderSpaceKeyboard = endKeyboardRect.origin.y - responderForScreen;
    if (responderSpaceKeyboard < 1.0) {
        CGFloat offsetY = ABS(responderSpaceKeyboard);
        [UIView animateWithDuration:duration animations:^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.actorView setTransform:CGAffineTransformMakeTranslation(0, -offsetY)];
        }];
    }else {
        [UIView animateWithDuration:duration animations:^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.actorView setTransform:CGAffineTransformIdentity];
        }];
    }
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

- (void)dealloc{
    
}
@end
