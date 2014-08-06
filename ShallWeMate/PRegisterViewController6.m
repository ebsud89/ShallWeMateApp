//
//  PRegisterViewController6.m
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController6.h"
#import "PRegisterViewController7.h"

@interface PRegisterViewController6 ()

@end

@implementation PRegisterViewController6
@synthesize houseData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.houseData printAll];
    
    selectionCol = [[SelectionCollectionViewController alloc]init];
    selectionCol.delegate = self;
    [selectionCol setNumberOfItemsInSection:(int)[houseData.enableLifeStyle count]];
    [selectionCol setSelectList:self.selectList];
    [selectionCol selectionListInit];
    
    [self.selectList setDelegate:selectionCol];
    [self.selectList setDataSource:selectionCol];
    
}

- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableLifeStyle replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableLifeStyle replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
}

//
//- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 8;
//}
//
//- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 15;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        PRegisterViewController7 *vc = [segue destinationViewController];
        vc.houseData = houseData;
    }
}


@end
