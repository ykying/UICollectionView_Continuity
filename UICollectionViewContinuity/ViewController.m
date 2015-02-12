//
//  ViewController.m
//  UICollectionViewContinuity
//
//  Created by King.Ying on 2/11/15.
//  Copyright (c) 2015 YKYING.com. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic) BOOL isGridMode;
@end

@implementation ViewController

#pragma mark - UICollectionView Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //Init Values
    CGFloat gap = 8.0;
    CGFloat width = 100;
    CGFloat height = 68.0;
    int columnCount = 2;
    
    if ([self isPad]) {
        gap = 12.0;
        if ([self isLandscape]) { //For Lanscape Row mode, reduce the width
            width = collectionView.frame.size.width-(gap*2)-300;
            height = 68.0;
            if (_isGridMode) { //For Lanscape Grid mode, 4 cell in a row
                columnCount = 4;
                width = (collectionView.frame.size.width - (gap*(columnCount+1)))/columnCount;
                height = width;
            }
        } else {
            width = collectionView.frame.size.width-(gap*2);
            height = 68.0;
            if (_isGridMode) {
                columnCount = 3;
                width = (collectionView.frame.size.width - (gap*(columnCount+1)))/columnCount;
                height = width;
            }
        }
    } else { //No Lanscape mode for iPhone
        gap = 8.0;
        width = collectionView.frame.size.width-(gap*2);
        height = 68.0;
        if (_isGridMode) {
            columnCount = 2;
            width = (collectionView.frame.size.width - (gap*(columnCount+1)))/columnCount;
            height = width;
        }
    }
    
    
    return CGSizeMake(width, height);
}

- (BOOL)isPad{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

- (BOOL)isLandscape{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    BOOL landscape = (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
    
    return landscape;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_theCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    [_theCollectionView setDelegate:self];
    [_theCollectionView setDataSource:self];
    [_theCollectionView setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSwitchPressed:(id)sender {
    [self setIsGridMode:!_isGridMode];
    [_theCollectionView performBatchUpdates:^{
        for (CollectionViewCell *cell in [_theCollectionView visibleCells]) {
            [cell updateLayout];
            
        }
    } completion:^(BOOL finished) {}];
    
}
@end
