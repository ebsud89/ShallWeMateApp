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
UIImageView *imgViewOff;
UIImageView *imgViewOn;
UIImageView *optionOff;
UIImageView *optionOn;


- (id) init
{
    
    
    
    return self;
}

- (void) selectItem:(int)index
{
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    //
    //    [self.selectList selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    //    NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
    
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
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 86, 108)];
        //    [imgView setContentMode:UIViewContentModeCenter];
        //    self.data = [[NSArray alloc]
        //                      initWithObjects:@"cook\n요리", @"Green",
        //                 @"Blue", @"Indigo", @"Violet", @"Green",
        //                 @"Blue", @"Indigo", @"Violet", @"Green",
        //                 @"Blue", @"Indigo", @"Violet", @"Green",
        //                 @"Blue", @"Indigo", @"Violet", nil];
        
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"lifestyle_01.png", @"lifestyle_02.png", @"lifestyle_03.png", @"lifestyle_04.png", @"lifestyle_05.png", @"lifestyle_06.png", @"lifestyle_07.png", @"lifestyle_08.png", @"lifestyle_09.png", @"lifestyle_10.png", @"lifestyle_11.png", @"lifestyle_12.png", @"lifestyle_13.png", @"lifestyle_14.png",  @"lifestyle_15.png", nil];
        self.picData = picArray;
        
        imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgView];
    }else if ([viewController isEqual:@"enableOptions"]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"가구1.png", @"가구2.png", @"가구3.png",@"가구4.png", @"가구5.png", @"가구6.png",@"가구7.png", @"가구8.png", @"가구9.png",@"가구10.png", @"가구11.png", @"가구12.png", nil];
        self.picData = picArray;
        
        imgView.image = [UIImage imageNamed:[self.picData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgView];
    } else if ([viewController isEqual:@"enableRoomsMore"]) {
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"침실", @"거실", @"부엌", @"욕실", @"세탁실", @"창고", @"서재", @"주차장", @"엘리베이터", nil];
        self.data = picArray;
        UILabel *roomInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 40)];
        roomInfo.text = [self.data objectAtIndex:indexPath.row];
        roomInfo.textColor = [UIColor lightGrayColor];
        [roomInfo setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18.0]];
        roomInfo.textAlignment = NSTextAlignmentCenter;
        roomInfo.backgroundColor = [UIColor clearColor];
        //        roomInfo.shadowColor = [UIColor lightGrayColor];
        //        roomInfo.shadowOffset = CGSizeMake(0.0, 1.0);
        [cell.contentView addSubview:roomInfo];
    } else if ([viewController isEqual:@"enableManagementStates"]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"관리비_가스비1.png",@"관리비_전기세1.png", @"관리비_수도세1.png", @"관리비_청소비1.png", @"관리비_통신료1.png", @"관리비_보안시스템1.png", @"관리비_화재보험료1.png", @"관리비_수선유지비1.png", nil];
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
        return CGSizeMake(86, 108);
    }else if ([viewController isEqual:@"enableOptions"]) {
        return CGSizeMake(60,68);
    }else if ([viewController isEqual:@"enableRoomsMore"]) {
        return CGSizeMake(85,55);
    }
    else /*if ([viewController isEqual:@"enableManagementStates"])*/ {
        return CGSizeMake(60,68);
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
            [self.delegate didSelectedItem:indexPath];
            //            [self.delegate didSelectedItem:indexPath];
            UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
            
            image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 85, 85)];
            image.image = [UIImage imageNamed:@"life_cover.png"];
            [cell.contentView addSubview:image];
        }
    } else if ([viewController isEqual:@"enableOptions"]) {
        [self.delegate didSelectedItem:indexPath];
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        NSArray *picArrayBlack = [[NSArray alloc] initWithObjects:@"가구1_1.png", @"가구2_1.png", @"가구3_1.png",@"가구4_1.png", @"가구5_1.png", @"가구6_1.png",@"가구7_1.png", @"가구8_1.png", @"가구9_1.png",@"가구10_1.png", @"가구11_1.png", @"가구12_1.png", nil];
        self.unselectedPicData = picArrayBlack;
        optionOff = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        optionOff.image = [UIImage imageNamed:[self.unselectedPicData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:optionOff];
    }else if ([viewController isEqual:@"enableRoomsMore"]) {
        [self.delegate didSelectedItem:indexPath];UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"침실", @"거실", @"부엌", @"욕실", @"세탁실", @"창고", @"서재", @"주차장", @"엘리베이터", nil];
        self.data = picArray;
        UILabel *roomInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 40)];
        [roomInfo setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18.0]];
        roomInfo.textAlignment = NSTextAlignmentCenter;
        roomInfo.text = [self.data objectAtIndex:indexPath.row];
        roomInfo.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
        [cell.contentView addSubview:roomInfo];
    }
    else if ([viewController isEqual:@"enableManagementStates"]){
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        //        image = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 50, 50)];
        NSArray *picArrayBlack = [[NSArray alloc] initWithObjects:@"관리비_1.png",@"관리비_2.png", @"관리비_3.png", @"관리비_4.png", @"관리비_5.png", @"관리비_6.png", @"관리비_7.png", @"관리비_8.png", nil];
        self.unselectedPicData = picArrayBlack;
        imgViewOff = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        imgViewOff.image = [UIImage imageNamed:[self.unselectedPicData objectAtIndex:indexPath.row]];
        //        imgView.image = nil;
        [cell.contentView addSubview:imgViewOff];
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
    }  else if ([viewController isEqual:@"enableOptions"]) {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        NSArray *picArrayBlack = [[NSArray alloc] initWithObjects:@"가구1.png", @"가구2.png", @"가구3.png",@"가구4.png", @"가구5.png", @"가구6.png",@"가구7.png", @"가구8.png", @"가구9.png",@"가구10.png", @"가구11.png", @"가구12.png", nil];
        self.unselectedPicData = picArrayBlack;
        optionOn = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        optionOn.image = [UIImage imageNamed:[self.unselectedPicData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:optionOn];
        
    }else if ([viewController isEqual:@"enableRoomsMore"]) {
        [self.delegate didSelectedItem:indexPath];UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        NSArray *picArray = [[NSArray alloc] initWithObjects:@"침실", @"거실", @"부엌", @"욕실", @"세탁실", @"창고", @"서재", @"주차장", @"엘리베이터", nil];
        self.data = picArray;
        UILabel *roomInfo = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 85, 40)];
        roomInfo.textAlignment = NSTextAlignmentCenter;
        roomInfo.text = [self.data objectAtIndex:indexPath.row];
        roomInfo.textColor = [UIColor lightGrayColor];
        [roomInfo setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18.0]];
        [cell.contentView addSubview:roomInfo];
    } else if ([viewController isEqual:@"enableManagementStates"]) {
        NSLog(@"did selectItem  %ld %ld", (long)indexPath.row, (long)indexPath.section);
        [self.delegate didSelectedItem:indexPath];
        UICollectionViewCell *cell = [self.selectList cellForItemAtIndexPath:indexPath];
        //        image = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 50, 50)];
        NSArray *picArrayBlack = [[NSArray alloc] initWithObjects:@"관리비_가스비1.png",@"관리비_전기세1.png", @"관리비_수도세1.png", @"관리비_청소비1.png", @"관리비_통신료1.png", @"관리비_보안시스템1.png", @"관리비_화재보험료1.png", @"관리비_수선유지비1.png", nil];
        self.unselectedPicData = picArrayBlack;
        imgViewOn = [[UIImageView alloc] initWithFrame:CGRectMake(6, 0, 51, 67)];
        imgViewOn.image = [UIImage imageNamed:[self.unselectedPicData objectAtIndex:indexPath.row]];
        [cell.contentView addSubview:imgViewOn];
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

//-(BOOL) collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

@end
