//
//  SWMManagementTableViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/20/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "SWMManagementTableViewCell.h"
#import "SWMCollectionViewCell4TableViewCell.h"

@interface SWMManagementTableViewCell ()

@end

@implementation SWMManagementTableViewCell
+ (CGFloat) getHeight
{
    return 115.0f;
    
    
}



+ (SWMManagementTableViewCell*) collectionViewTableViewCell
{
    SWMManagementTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SWMManagementTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)awakeFromNib
{
    // Initialization code
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    /* uncomment this block to use subclassed cells */
    [self.collectionView registerClass:[SWMCollectionViewCell4TableViewCell class] forCellWithReuseIdentifier:@"collectionViewCell4TableViewCell"];
    /* end of subclass-based cells block */
    
    // Configure layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(84, 84)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

-(void) setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}



// 컬렉션 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        return CGSizeMake(50, 58);
  
}

- (void) setManagements:(NSMutableArray *)managements
{
    self.imageArray = [[NSMutableArray alloc]init];
    for (int i=0; i<[managements count]; i++) {
        NSNumber *num = [managements objectAtIndex:i];
        if ([num boolValue]) {
            [self.imageArray addObject:[NSString stringWithFormat:@"관리비_%d.png",i+1]];
        }
    }
    
    //    if ([self.imageArray count]<6) {
    //        for (int i= (int)[self.imageArray count]; i<6; i++) {
    //            [self.imageArray addObject:@""];
    //        }
    //    }
    
    [self.collectionView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"collectionViewCell4TableViewCell";
    
    /*  Uncomment this block to use nib-based cells */
    // UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    // [titleLabel setText:cellData];
    /* end of nib-based cell block */
    
    /* Uncomment this block to use subclass-based cells */
    
    SWMCollectionViewCell4TableViewCell *cell = (SWMCollectionViewCell4TableViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    NSString *imageArr = [self.imageArray objectAtIndex:indexPath.row];
    UIImage *badgeImg = [UIImage imageNamed:imageArr];
    UIImageView *imView = [[UIImageView alloc]initWithFrame:cell.frame];
    imView.image = badgeImg;
    
    NSLog(@"%@", imageArr);
    [cell addSubview:imView];
    
    //    cell.badgeImageView = imView;
    /* end of subclass-based cells block */
    
    // Return the cell
    return cell;
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
