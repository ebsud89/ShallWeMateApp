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
UIImageView *image;
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
    
    if ([viewController isEqual:@"lifeStyle"]) {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 84, 84)];
//    [imgView setContentMode:UIViewContentModeCenter];
//    self.data = [[NSArray alloc]
//                      initWithObjects:@"cook\n요리", @"Green",
//                 @"Blue", @"Indigo", @"Violet", @"Green",
//                 @"Blue", @"Indigo", @"Violet", @"Green",
//                 @"Blue", @"Indigo", @"Violet", @"Green",
//                 @"Blue", @"Indigo", @"Violet", nil];
    
    NSArray *picArray = [[NSArray alloc] initWithObjects:@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png", @"face_test.png", @"face_test.png", @"face_test.png", @"face_test.png", @"face_test.png", @"face_test.png", @"face_test.png",nil];
    self.picData = picArray;
    
    imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:imgView];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 86, 100, 30)];
    [lable setFont:[UIFont systemFontOfSize:10]];
    [lable setNumberOfLines:0];
    [lable setLineBreakMode:UILineBreakModeWordWrap];
    [lable setTextColor:[UIColor darkGrayColor]];
    [lable setText:[NSString stringWithFormat:@"cook\n요리",indexPath.section,indexPath.row]];
    [lable setTextAlignment:NSTextAlignmentCenter];
    
    [cell.contentView addSubview:lable];
    }else if ([viewController isEqual:@"enableOptions"]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png", nil];
        self.picData = picArray;
        
        imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgView];
    } else if ([viewController isEqual:@"enableRoomsMore"]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png", @"face_test.png", @"face_test.png", @"face_test.png",nil];
        self.picData = picArray;
        
        imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgView];
        NSLog(@"image size : %f %f", imgView.frame.size.width,imgView.image.size.height);
        NSLog(@"view size : %f", cell.contentView.frame.size.width);
    } else if ([viewController isEqual:@"enableManagementStates"]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png",@"cook.png", @"movie.png", @"interior.png", @"face_test.png", @"face_test.png", @"face_test.png",nil];
        self.picData = picArray;
        
        imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgView];
    }
    return cell;
    
}
// 컬렉션 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([viewController isEqual:@"lifeStyle"]) {
        return CGSizeMake(98,114);
    }else if ([viewController isEqual:@"enableOptions"]) {
        return CGSizeMake(65,65);
    }else if ([viewController isEqual:@"enableRoomsMore"]) {
        return CGSizeMake(90,90);
    }
    else {
        return CGSizeMake(65,65);
    }
}

// 컬렉션과 컬렉션 width 간격
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

// 컬렉션과 컬렉션 height 간격
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([viewController isEqual:@"lifeStyle"]) {
        if (count < 6){
            count++;
            NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
            [self.delegate didSelectedItem:indexPath];UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
            
            image = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 84, 84)];
            image.image = [UIImage imageNamed:@"life_cover.png"];
            [cell.contentView addSubview:image];
        }
    } else if ([viewController isEqual:@"enableOptions"]) {
        [self.delegate didSelectedItem:indexPath];UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        
        image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        image.image = [UIImage imageNamed:@"life_cover.png"];
        [cell.contentView addSubview:image];
    }else if ([viewController isEqual:@"enableRoomsMore"]) {
        [self.delegate didSelectedItem:indexPath];UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        
        image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
        image.image = [UIImage imageNamed:@"life_cover.png"];
        [cell.contentView addSubview:image];
    }
    else {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
        
        
        image.image = [UIImage imageNamed:@"life_cover.png"];
        [cell.contentView addSubview:image];
//        cell.layer.borderColor = [UIColor blueColor].CGColor;
//        cell.layer.borderWidth = 3.0f;
    }
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([viewController isEqual:@"lifeStyle"]) {
        if (count <= 6){
            count--;
        NSLog(@"did DeSelectItem %ld", (long)indexPath.row);
        [self.delegate didDeSelectedItem:indexPath];
            
        image.image = nil;
        }
    } else {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        image.image = nil;
//        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
//        cell.layer.borderColor = nil;
//        cell.layer.borderWidth = 0.0f;
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
