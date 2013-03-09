//
//  HTProductListingController.m
//  SpreeMob
//
//  Created by Hariharan Thiagarajan on 09/03/13.
//  Copyright (c) 2013 HTech. All rights reserved.
//

#import "HTProductListingController.h"
#import "HTProductList.h"
#import "HTProductCell.h"

@interface HTProductListingController ()
{
    HTProductList *productList;
}
@end

@implementation HTProductListingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    productList = [[HTProductList alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HTProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    
    cell.productName.text = productList.productList[indexPath.row];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [productList itemCount];
}

@end
