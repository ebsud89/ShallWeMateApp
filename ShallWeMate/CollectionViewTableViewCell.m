//
//  CollectionViewTableViewCell.m
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "CollectionViewTableViewCell.h"
#import "SWMCollectionViewCell4TableViewCell.h"

@implementation CollectionViewTableViewCell

+ (CGFloat) getHeight
{
    return 240.0f;
    
    
}



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
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    /* uncomment this block to use subclassed cells */
    [self.collectionView registerClass:[SWMCollectionViewCell4TableViewCell class] forCellWithReuseIdentifier:@"collectionViewCell4TableViewCell"];
    /* end of subclass-based cells block */
    
    // Configure layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(84, 84)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

-(void) setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (void) setLifestyle:(NSMutableArray *)lifestyle
{
    self.imageArray = [[NSMutableArray alloc]init];
    for (int i=0; i<[lifestyle count]; i++) {
        NSNumber *num = [lifestyle objectAtIndex:i];
        if ([num boolValue]) {
            [self.imageArray addObject:[NSString stringWithFormat:@"lifestyle_0%d copy.png",i+1]];
        }
    }
    
    if ([self.imageArray count]<6) {
        for (int i= (int)[self.imageArray count]; i<6; i++) {
            [self.imageArray addObject:@""];
        }
    }
    
    [self.collectionView reloadData];
}


-(void)setEnableRoomsMore:(NSMutableArray *)enableRoomsMore {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self.dataArray addObject:@"침실"];
    [self.dataArray addObject:@"거실"];
    [self.dataArray addObject:@"부엌"];
    [self.dataArray addObject:@"욕실"];
    [self.dataArray addObject:@"세탁실"];
    [self.dataArray addObject:@"창고"];
    [self.dataArray addObject:@"서재"];
    [self.dataArray addObject:@"주차장"];
    [self.dataArray addObject:@"엘리베이터"];
    
    [self.collectionView reloadData];
}

// 컬렉션 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
//    if ([appDelegate.data isEqualToString:@"lifestyle"]) {
        return CGSizeMake(70, 70);
//    } else {
//        return CGSizeMake(70, 70);
//    }
}

// 컬렉션과 컬렉션 height 간격
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
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
    UIImageView *imView = [[UIImageView alloc] initWithImage:badgeImg];
    imView.frame = CGRectMake(imView.frame.origin.x, imView.frame.origin.y, cell.contentView.frame.size.width, cell.contentView.frame.size.height);
    

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
