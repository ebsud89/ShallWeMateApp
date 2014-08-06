//
//  CollectionViewTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "CollectionViewTableViewCell.h"

@implementation CollectionViewTableViewCell

+ (CollectionViewTableViewCell*) collectionViewTableViewCell
{
    CollectionViewTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"CollectionViewTableViewCell" owner:self options:nil] objectAtIndex:0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)awakeFromNib
{
    // Initialization code
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//        [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"collectionViewTableViewCell"];
    
//    [self.collectionView registerNib:[UINib nibWithNibName:@"KTCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
//    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
}

-(void) setTitle:(NSString *)title
{
    self.titleLabel.text = title;
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

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
//    imgView.image = [UIImage imageNamed:@"makefg.php.png"];
//    
//    [cell.contentView addSubview:imgView];
//    
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 100, 30)];
//    //    [lable setText:[NSString stringWithFormat:@"[JW]%d-%d",indexPath.section,indexPath.row]];
//    
//    [cell.contentView addSubview:lable];
    
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
