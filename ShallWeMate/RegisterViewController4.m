//
//  RegisterViewController4.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController4.h"
#import "RegisterViewController5.h"

@interface RegisterViewController4()
@end
@implementation RegisterViewController4

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
    
    // init
    lifeStyleArray = [[NSMutableArray alloc] init];
    int i;
    for (i = 0; i < 15; i++) {
        [lifeStyleArray addObject:@"0"];
    }
    
//    [lifeStyleArray insertObject:@"|" atIndex:4];
    for (i = 0; i < 14; i+2) {
        [lifeStyleArray insertObject:@"|" atIndex:i+1];
    }
    NSString *lifeStyleString = [lifeStyleArray componentsJoinedByString:@"\n"];
    
    NSLog(@"array test : %@", lifeStyleString);
    
    selectionCol = [[SelectionCollectionViewController alloc]init];
    selectionCol.viewController = @"lifeStyle";
    [selectionCol setNumberOfItemsInSection:15];
    [selectionCol setSelectList:self.selectList];
    [selectionCol selectionListInit];
    
    [self.selectList setDelegate:selectionCol];
    [self.selectList setDataSource:selectionCol];
    
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (void) refreshHouseData
{
    
    
    /* 수요자측 데이터 (라이프스타일) 뿌리기
     
     */
    
    
    //    if (_houseData.title != nil) {
    //        self.houseTitleTextField.text = _houseData.title;
    //    }
    //
    //    if (_houseData.transportation != nil) {
    //        self.subwaySearchBtn.titleLabel.text = _houseData.nearSubwayStation;
    //    }
    //
    //    if (_houseData.transportation != nil) {
    //        NSLog(@"걸어서");
    //    }
    //
    //    if (_houseData.transportationMinutes != nil) {
    //        self.subwayMinutesTextFiled.text = _houseData.transportationMinutes;
    //    }
    //
    //    if (_houseData.introHouse != nil) {
    //        self.introHouse.text = _houseData.introHouse;
    //    }
    
}
- (void)fillhouseData
{
    /* 기입한 정보 (라이프 스타일) 저장하기 
        */
//    int i;
//    for (i = 0; i < 14; i+2) {
//        [lifeStyleArray insertObject:@"|" atIndex:i+1];
//    }
    
    //    _houseData.title = self.houseTitleTextField.text;
    //    _houseData.nearSubwayStation = self.subwaySearchBtn.titleLabel.text;
    //    _houseData.transportation = @"걸어서";
    //    _houseData.transportationMinutes = self.subwayMinutesTextFiled.text;
    //    _houseData.introHouse = self.introHouse.text;
    //    _houseData.premium = self.premiumBrandName;
}


- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    /* 선택(1)한 라이프 스타일을 라이프스타일 스트링에 추가 */
    [_memberData.enableLifeStyle replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
 
    [lifeStyleArray replaceObjectAtIndex:indexPath.row withObject:@"1"];
    
//    if (lifeStyleString != nil) {
//        lifeStyleString = [lifeStyleString stringByAppendingString:@"|1"];
//    } else {
//        
//        lifeStyleString = [lifeStyleString stringByAppendingString:@"1"];
//    }
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    /* 선택하지 않은(0) 라이프 스타일을 라이프 스타일 스트링에 추가*/
    [_memberData.enableLifeStyle replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
    
    
    [lifeStyleArray replaceObjectAtIndex:indexPath.row withObject:@"0"];
    
//    if (lifeStyleString != nil) {
//        lifeStyleString = [lifeStyleString stringByAppendingString:@"|0"];
//    } else {
//        
//        lifeStyleString = [lifeStyleString stringByAppendingString:@"0"];
//    }
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


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        RegisterViewController5 *vc = [segue destinationViewController];
        
        /* 기입한 정보를 다음 뷰로 전달*/
        
        vc.memberData = _memberData;
        [self fillhouseData];
        
    }
}


@end
