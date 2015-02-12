//
//  HomeCell.h
//  UICollectionViewContinuity
//
//  Created by King.Ying on 1/29/15.
//  Copyright (c) 2015 YKYING.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellBg;
@property (weak, nonatomic) IBOutlet UIImageView *cellIcon;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellSubtitle;

//Icon Position Constraint
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWidth;

//Text Set Position Constraint
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textSetTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textSetLeft;

- (void)updateLayout;
@end
