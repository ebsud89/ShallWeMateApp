//
//  SelectionCollectionViewController.m
//  start
//
//  Created by 컴049 on 2014. 7. 23..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SelectionCollectionViewController.h"

@implementation SelectionCollectionViewController
@synthesize viewController;
int count = 0;

- (id) init
{
    

    
    return self;
}

- (void) selectItem:(int)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];

    [self.selectList selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);

}

- (void) selectionListInit
{
    [self.selectList setBackgroundColor:[UIColor whiteColor]];
    
    [self.selectList setAllowsMultipleSelection:YES];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.numberOfItemsInSection;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.selectList dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    imgView.image = [UIImage imageNamed:@"makefg.php.png"];
    
    [cell.contentView addSubview:imgView];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 100, 30)];
    //    [lable setText:[NSString stringWithFormat:@"[JW]%d-%d",indexPath.section,indexPath.row]];
    
    [cell.contentView addSubview:lable];
    
    return cell;
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([viewController isEqual:@"lifeStyle"]) {
        if (count < 6){
        count++;
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
    
        cell.layer.borderColor = [UIColor blueColor].CGColor;
        cell.layer.borderWidth = 3.0f;
        }
    } else {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        
        cell.layer.borderColor = [UIColor blueColor].CGColor;
        cell.layer.borderWidth = 3.0f;
    }
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([viewController isEqual:@"lifeStyle"]) {
        if (count <= 6){
        count--;
        NSLog(@"did DeSelectItem %ld", (long)indexPath.row);
        [self.delegate didDeSelectedItem:indexPath];
    
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
    
        cell.layer.borderColor = nil;
        cell.layer.borderWidth = 0.0f;
        }
    } else {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        
        cell.layer.borderColor = [UIColor blueColor].CGColor;
        cell.layer.borderWidth = 3.0f;
    }
}


//- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 4;
//}
//
//- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 4;
//}

-(BOOL) collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
