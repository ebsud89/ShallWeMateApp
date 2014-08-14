//
//  PRegisterViewController4.m
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController4.h"
#import "PRegisterViewController5.h"

@interface PRegisterViewController4 ()

@end

@implementation PRegisterViewController4
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
    
    selectCol = [[SelectionCollectionViewController alloc]init];
    selectCol.delegate = self;
    [selectCol setNumberOfItemsInSection:(int)[houseData.enableOptions count]];
//    NSArray *picArray = [[NSArray alloc] initWithObjects:@"makefg.php.png", @"face_test.png", @"face_test.png", @"face_test.png",@"face_test.png",nil];
//    self.picData = picArray
    
    [selectCol setSelectList:self.selectList];
    [selectCol selectionListInit];
    selectCol.viewController = @"enableOptions";
    [self.selectList setDelegate:selectCol];
    [self.selectList setDataSource:selectCol];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableOptions replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableOptions replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
    
}
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
        
        PRegisterViewController5 *vc = [segue destinationViewController];
        vc.houseData = houseData;
    }
}


@end
