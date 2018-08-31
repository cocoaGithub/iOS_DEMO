//
//  ViewController.m
//  CCCollectionStretchAnim
//
//  Created by cocoa on 2018/8/30.
//  Copyright © 2018年 cocoa. All rights reserved.
//

#import "ViewController.h"
#import "CCCollectionViewCell.h"
#import "CCStretchAnimView.h"
#import <Masonry.h>

#define seckill_collection_item_height 146
#define seckill_collection_item_width 115
#define seckill_coolection_left_margin 15
#define seckill_coolection_right_margin 10
#define collectionCellId @"collectionCellId"

#define COLLECTION_CELL_COUNT 5

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) CCStretchAnimView *footerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [_collectionView registerClass:[CCCollectionViewCell class] forCellWithReuseIdentifier:collectionCellId];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView setShowsHorizontalScrollIndicator:NO];
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(seckill_collection_item_width, seckill_collection_item_height);
    [self.view addSubview:_collectionView];
    
    _footerView = [[CCStretchAnimView alloc] init];
    [_collectionView addSubview:_footerView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.height.equalTo(@(seckill_collection_item_height));
    }];
    [self updateData];
}

- (void)updateData {
    CGFloat collectionWidth = COLLECTION_CELL_COUNT * seckill_collection_item_width + seckill_coolection_left_margin + seckill_coolection_right_margin;
    if (collectionWidth < cScreenWidth) {
        _footerView.hidden = YES;
    } else {
        _footerView.hidden = NO;
        [_footerView contentWidth:collectionWidth];
    }
    
    [self.collectionView reloadData];
    [_collectionView setContentOffset:CGPointZero animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_footerView scrollViewContentOffsetChanged:scrollView.contentOffset];
}

- (void)doSomething {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"action" message:@"to do something" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

#pragma mark - collectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return COLLECTION_CELL_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellId forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self doSomething];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, seckill_coolection_left_margin, 0, seckill_coolection_right_margin);
}

#pragma mark - scrollViewDelegate

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scroll position:%f,%f",scrollView.contentOffset.x, scrollView.contentOffset.y);
    NSLog(@"scroll contenSize:%f,%f",scrollView.contentSize.width, scrollView.contentSize.height);
    if ((scrollView.contentOffset.x + cScreenWidth) > (scrollView.contentSize.width + CC_Stretch_Rigth_Offset)) {
        [self doSomething];
    }
}



@end
