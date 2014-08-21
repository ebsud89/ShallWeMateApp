//
//  SWMMainDetailViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMainDetailViewController.h"
#import "CollectionViewTableViewCell.h"
#import "TitleTableViewCell.h"
#import "ManagementTableViewCell.h"
#import "SWMImageScrollTableViewCell.h"
#import "SWMTableViewCell.h"
#import "SWMRoomInfoTableViewCell.h"
#import "SWMQAndATableViewCell.h"
#import "SWMNetwork.h"
#import "SWMManagementTableViewCell.h"
#import "SWMTransportTableViewCell.h"

@interface SWMMainDetailViewController ()

@end

@implementation SWMMainDetailViewController

@synthesize myTitle;
@synthesize shareView;
@synthesize detailView;
@synthesize leftView, rightView;
@synthesize houseImageArray;
@synthesize doorView;

const int inervalValue = 60;

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
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"titleTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"ManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"managementTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"collectionViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"mcollectionViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMImageScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageScrollViewTableViewCell"];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMTransportTableViewCell" bundle:nil] forCellReuseIdentifier:@"TransportTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMRoomInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"RoomInfoTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMQAndATableViewCell" bundle:nil] forCellReuseIdentifier:@"QAndATableViewCell"];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.detailView];
    

    
    self.titleLabel.text = myTitle;
    
    // share 페이지 애니메이션
    shareMode = NO;
    
    [self.view bringSubviewToFront:detailView];
//    [self.shareView removeFromSuperview];
//    [self.doorView removeFromSuperview];
    
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    //network
    
    SWMNetwork *network = [[SWMNetwork alloc]init];
    NSArray *myArry = [network getAllRooms];
    NSLog(@"방 갯수: %ld", [myArry count]);
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (shareMode) {
        [NSTimer scheduledTimerWithTimeInterval: 0.0f
                                         target: self
                                       selector: @selector(endShareViewAni)
                                       userInfo: nil
                                        repeats: NO];
        shareMode = NO;
    }

}

-(void) setHouseImageArray:(NSArray *)houseImageArrays
{
    houseImageArray = [[NSArray alloc]initWithArray:houseImageArrays];
}



// 애니메이션

-(void) startShareViewAni
{
    //Determine how far the doors need to move for them to disappear from view
    
    //    float adjust = (CGRectGetWidth(self.view.frame) > CGRectGetHeight(self.view.frame)) ? CGRectGetWidth(self.view.frame) : CGRectGetHeight(self.view.frame);
    
    UIImageView *myImgView = [self createImg:self.navigationController.view];
    UIImageView *myImgView2 = [self createImageViewLeft:myImgView];
    UIImageView *myImgView3 = [self createimageViewRight:myImgView];
    
    self.leftView = myImgView2;
    self.rightView = myImgView3;
    
    [doorView addSubview:self.leftView];
    [doorView addSubview:self.rightView];
    [doorView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    
    shareView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    [self.view bringSubviewToFront:shareView];
    [self.view bringSubviewToFront:doorView];
    
    //Retrieve the original frame and then adjust the X position accordingly
    CGRect leftFrame = self.leftView.frame;
	CGRect rightFrame = self.rightView.frame;
    
    NSLog(@"%f, %f", leftFrame.origin.x, rightFrame.origin.x);
    
    leftFrame.origin.x = - self.view.bounds.size.width/2;
    rightFrame.origin.x = self.view.bounds.size.width;
    
//    [self.view addSubview:self.shareView];
//    [self.view addSubview:self.doorView];
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [UIView animateWithDuration:0.5
     
                     animations:^{
                         shareView.transform = CGAffineTransformMakeScale(1, 1);
                         NSLog(@"%f", leftFrame.origin.x);
                         self.leftView.frame = leftFrame;
                         self.rightView.frame = rightFrame;
                     }
                     completion:^(BOOL finished){
                         [self.view bringSubviewToFront:shareView];
                     }
     ];
    
    
}

-(void) endShareViewAni
{
    
    CGRect leftFrame = self.leftView.frame;
	CGRect rightFrame = self.rightView.frame;
    
    leftFrame.origin.x = 0;
    rightFrame.origin.x = self.view.bounds.size.width/2;
    
    [self.view bringSubviewToFront:doorView];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.leftView.frame = leftFrame;
                         self.rightView.frame = rightFrame;
                     }
                     completion:^(BOOL finished){
                         [self.navigationController.navigationBar setHidden:NO];
                         [self.leftView removeFromSuperview];
                         [self.rightView removeFromSuperview];
                         
                         self.leftView.image = nil;
                         self.rightView.image = nil;
                         
                         [self.view bringSubviewToFront:detailView];
                     }
     ];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PinchGestureRec:(id)sender {
    NSLog(@"Pinch Gesture... ");
    
    if (shareMode == NO) {
        NSLog(@"문열음");
        
        
        
        [NSTimer scheduledTimerWithTimeInterval: 0.1
                                         target: self
                                       selector: @selector(startShareViewAni)
                                       userInfo: nil
                                        repeats: NO];
        
        shareMode = YES;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches Began");
    
    if (shareMode == YES) {
        NSLog(@"문 닫음");
        
        
        
        [NSTimer scheduledTimerWithTimeInterval: 0.1
                                         target: self
                                       selector: @selector(endShareViewAni)
                                       userInfo: nil
                                        repeats: NO];
        shareMode = NO;
    }
}



- (UIImageView*) createImageViewLeft:(UIImageView*)view
{
    CGSize snapSize = CGSizeMake(view.frame.size.width/2, view.frame.size.height);
    UIGraphicsBeginImageContext(snapSize);
    
    [view.image drawAtPoint:CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height).origin];
    
    UIImage *aboveViewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *aboveSnapView = [[UIImageView alloc]initWithImage:aboveViewSnapShot];
    //    aboveSnapView.contentMode = UIViewContentModeScaleToFill;
    aboveSnapView.contentMode = UIViewContentModeRight;
    [aboveSnapView setFrame:CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height)];
    return aboveSnapView;
}

- (UIImageView*) createimageViewRight:(UIImageView*)view
{
    CGSize snapSize = CGSizeMake(view.frame.size.width/2, view.frame.size.height);
    UIGraphicsBeginImageContext(snapSize);
    
    [view.image drawAtPoint:CGRectMake(-view.frame.size.width/2, 0, view.frame.size.width, view.frame.size.height).origin];
    
    UIImage *aboveViewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *aboveSnapView = [[UIImageView alloc]initWithImage:aboveViewSnapShot];
    aboveSnapView.contentMode = UIViewContentModeScaleToFill;
    //    aboveSnapView.contentMode = UIViewContentModeRight;
    [aboveSnapView setFrame:CGRectMake(view.frame.size.width/2, 0, view.frame.size.width/2, view.frame.size.height)];
    return aboveSnapView;
}


-(UIImageView *)createImg:(UIView*)view
{
    
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewSnapShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [[UIImageView alloc]initWithImage:viewSnapShot];
}

#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return [SWMImageScrollTableViewCell getHeight];
    }
    else if(indexPath.row == 1){
        return [TitleTableViewCell getHeight];
    }
    else if(indexPath.row == 2){
        return [ManagementTableViewCell getHeight];
    }
    else if (indexPath.row == 3){
        return [SWMManagementTableViewCell getHeight];
    }
    else if (indexPath.row == 4)
    {
        return [SWMTransportTableViewCell getHeight];
    }
    else if (indexPath.row == 5)
    {
        return [SWMRoomInfoTableViewCell getHeight];
    }
    else if (indexPath.row == 6){
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 7){
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 8){
        return [SWMQAndATableViewCell getHeight];
    }
    else
        return 90.0f; //cell for comments, in reality the height has to be adjustable
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return 9;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (indexPath.row == 0)
    {
        SWMImageScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageScrollViewTableViewCell"];
        //        cell.houseImageArray = self.houseData.houseImageArray;
        
        [cell refreshData];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell 
        return cell;
    }
    else if (indexPath.row ==1)
    {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleTableViewCell"];
        
        if (cell == nil) {
            cell = [TitleTableViewCell titleTableViewCell];
        }
        
        [cell setTitle:_houseData.title];//@"디저트를 좋아하는 사람들의 하우스"];
        [cell setContent:_houseData.description];//@"진짜 재밌고, 유쾌한 사람들이 모여 사는 쉐어하우스입니다. 많은 관심을 가지고 오세요"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==2)
    {
        ManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"managementTableViewCell"];
        
        [cell setMonthlyCost:self.houseData.monthlyRentCost];
        [cell setSecurityCost:self.houseData.securityCost];
        [cell setManagementCost:self.houseData.securityCost];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 3)
    {
        SWMManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mcollectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [SWMManagementTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"관리비 포함 사항"];
        [cell setLifestyle:_houseData.enableManagementStates];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==4)
    {
        SWMTransportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransportTableViewCell"];
        [cell setSubwayDictionary:_houseData.subwayDic];
        [cell setHow:_houseData.transportation];
        [cell setMinutes:_houseData.transportationMinutes];
        return cell;
    }
    else if (indexPath.row == 5)
    {
        SWMRoomInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomInfoTableViewCell"];
        [cell setWomenN:_houseData.wantWomenNum];
        [cell setMemN:_houseData.wantMenNum];
        [cell setWantN:_houseData.roomEmpty];
        [cell setAllN:_houseData.roomAll];
        
        return cell;
    }
    else if (indexPath.row == 6)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"클남~~~");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"공간구성"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLifestyle:_houseData.enableRoomsMore];
        appDelegate.data = @"room";
        return cell;
    }
    else if (indexPath.row == 7)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"제공되는 옵션"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setLifestyle:_houseData.enableOptions];
        appDelegate.data = @"option";
        return cell;
    }
    else if (indexPath.row == 8)
    {
        SWMQAndATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QAndATableViewCell"];
        
        return cell;
    }
    else
    {
        return nil;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
//    // Get visible cells on table view.
//    NSArray *visibleCells = [self.contentTableView visibleCells];
//    
//    for (SWMTableViewCell *cell in visibleCells) {
//        [cell cellOnTableView:self.contentTableView didScrollOnView:self.view];
//    }
    
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    
    NSLog(@"%f", translation.y);
    
    if(translation.y > 0)
    {
        // react to dragging right
        if (!scrollDir) {
            scrollDir = YES;
            [self scrollViewDidChangedDirection];
            
        }
        //        NSLog(@"Down");
    } else
    {
        // react to dragging left
        if (scrollDir) {
            scrollDir = NO;
            [self scrollViewDidChangedDirection];
            
        }
        //        NSLog(@"Up");
    }
}

- (void) scrollViewDidChangedDirection
{
    if (scrollDir) {
        // DOWN
        //        [self.navigationController setNavigationBarHidden:YES];
        [animator removeAllBehaviors];
        
        
        behavior = [[UIAttachmentBehavior alloc]initWithItem:self.mateButton attachedToAnchor:CGPointMake(160.0f, 550.0f)];
        
        behavior.length = 2.0;
        behavior.damping = 0.9;
        behavior.frequency = 2.0;
        
        [animator addBehavior:behavior];
    }
    else
    {
        // UP
        
        [animator removeAllBehaviors];
        
        
        behavior = [[UIAttachmentBehavior alloc]initWithItem:self.mateButton attachedToAnchor:CGPointMake(160.0f, 597.0f)];
        
        behavior.length = 2.0;
        behavior.damping = 0.9;
        behavior.frequency = 2.0;
        
        [animator addBehavior:behavior];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.contentView.backgroundColor = [UIColor whiteColor];
}

- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
