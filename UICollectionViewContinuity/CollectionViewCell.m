//
//  HomeCell.m
//  UICollectionViewContinuity
//
//  Created by King.Ying on 1/29/15.
//  Copyright (c) 2015 YKYING.com. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()

@property (nonatomic, strong) NSMutableDictionary *currentDict;
@property (nonatomic) BOOL firstLoad;
@end

@implementation CollectionViewCell

- (void)awakeFromNib {
    [self setFirstLoad:YES];
}

- (void)prepareForReuse{
    [super prepareForReuse];
}


- (void)updateLayout{
    
    CGFloat bgAlpha = 0.0;
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    NSLog(@"w:%f; win/2:%@",self.frame.size.width, NSStringFromCGRect(window.frame));
    if (self.frame.size.width>(window.frame.size.width/2)) { //Full Row Mode

        [_iconTop setConstant:4.0];
        [_iconLeft setConstant:4.0];
        [_textSetTop setConstant:9.0];
        [_textSetLeft setConstant:_iconLeft.constant+_iconWidth.constant+8];
        bgAlpha = 0.0;
        
    } else { //Grid Mode
    
        [_iconTop setConstant:38];
        [_iconLeft setConstant:(self.frame.size.width-_iconWidth.constant)/2.0];
        [_textSetTop setConstant:134];
        [_textSetLeft setConstant:0];
        bgAlpha = 1.0;
    }
    
    [self setNeedsUpdateConstraints]; //First Load no need animation
    [UIView animateWithDuration:(_firstLoad?0.0:0.3) animations:^{
        [self layoutIfNeeded];
        [_cellBg setAlpha:bgAlpha];
    } completion:^(BOOL finished) {
        [self setFirstLoad:NO];
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self updateLayout];
}

@end
