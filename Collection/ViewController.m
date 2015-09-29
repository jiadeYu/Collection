//
//  ViewController.m
//  Collection
//
//  Created by jiadeyu on 15/7/1.
//  Copyright (c) 2015年 jiadeyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic)UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initCollectionView];
}

- (void)initCollectionView{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    if ([UIScreen mainScreen].bounds.size.width > 320) {
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake((([UIScreen mainScreen].bounds.size.width - 60*5)/6), 20, [UIScreen mainScreen].bounds.size.width - (([UIScreen mainScreen].bounds.size.width - 60*5)/6)*2, [UIScreen mainScreen].bounds.size.height-20) collectionViewLayout:flowLayout];
    }else{
        self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake((([UIScreen mainScreen].bounds.size.width - 60*4)/5), 20, [UIScreen mainScreen].bounds.size.width - (([UIScreen mainScreen].bounds.size.width - 60*4)/5)*2, [UIScreen mainScreen].bounds.size.height-20) collectionViewLayout:flowLayout];
    }
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1000;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(60, 80);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor blackColor ];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    label.textAlignment = NSTextAlignmentCenter;
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 60, 20)];
    nameLabel.textColor = [UIColor greenColor];
    nameLabel.backgroundColor = [UIColor whiteColor];
    nameLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    nameLabel.textAlignment = NSTextAlignmentCenter;

    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:nameLabel];
    [cell.contentView addSubview:label];

    return cell;
}

@end
