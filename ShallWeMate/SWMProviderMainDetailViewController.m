//
//  SWMProviderMainDetailViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMProviderMainDetailViewController.h"
#import "CollectionViewTableViewCell.h"
#import "TitleTableViewCell.h"
#import "ManagementTableViewCell.h"
#import "SWMImageScrollTableViewCell.h"
#import "SWMTableViewCell.h"

@interface SWMProviderMainDetailViewController ()

@end

@implementation SWMProviderMainDetailViewController

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
    NSLog(@"DetailViewControll Start");
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"titleTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"ManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"managementTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"collectionViewTableViewCell"];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMImageScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageScrollViewTableViewCell"];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
//    [self.contentTableView setBounces:NO];
    
    animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
//    lastGestureVelocity = CGPointMake(0.0f, 999.0f);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 4){
        return [CollectionViewTableViewCell getHeight];
    }
    else
        return 100.0f; //cell for comments, in reality the height has to be adjustable
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return 5;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        SWMImageScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageScrollViewTableViewCell"];
//        cell.houseImageArray = self.houseData.houseImageArray;
        
        [cell refreshData];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==1)
    {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleTableViewCell"];
        
        if (cell == nil) {
            cell = [TitleTableViewCell titleTableViewCell];
        }
        
        [cell setTitle:@"디저트를 좋아하는 사람들의 하우스"];
        [cell setContent:@"진짜 재밌고, 유쾌한 사람들이 모여 사는 쉐어하우스입니다. 많은 관심을 가지고 오세요"];
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
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"클남~~~");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"라이프스타일 키워드"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 4)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"라이프 스타일 키워드"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        return nil;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    // Get visible cells on table view.
    NSArray *visibleCells = [self.contentTableView visibleCells];
    
    for (SWMTableViewCell *cell in visibleCells) {
        [cell cellOnTableView:self.contentTableView didScrollOnView:self.view];
    }
    
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
        
        
        behavior = [[UIAttachmentBehavior alloc]initWithItem:self.mateButton attachedToAnchor:CGPointMake(160.0f, 544.0f)];
        
        behavior.length = 2.0;
        behavior.damping = 0.9;
        behavior.frequency = 2.0;
        
        [animator addBehavior:behavior];
    }
    else
    {
// UP
        
        [animator removeAllBehaviors];
        
        
        behavior = [[UIAttachmentBehavior alloc]initWithItem:self.mateButton attachedToAnchor:CGPointMake(160.0f, 594.0f)];
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Setup right view controller
    //    MENU_CONTROLLER.rightViewController = [[RightViewController alloc] init];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)refreshUI
{
    // Update label
    //    _numberLabel.text = [NSString stringWithFormat:@"%d", _number];
}

#pragma mark - UI Actions
- (IBAction)menuBtnTouch:(id)sender
{
    
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"number"] && [self isViewLoaded])
    {
        [self refreshUI];
    }
}

#pragma mark - PZSideMenuProtocol methods
- (void)viewWillReduceFromLeft:(NSNumber *)fromLeft
{
    //    if ([fromLeft boolValue])
    //        MENU_CONTROLLER.rightViewController = nil;
}

- (void)viewDidGrow
{
    //    if (!_rightViewController)
    //        _rightViewController = [[RightViewController alloc] init];
    
    //    MENU_CONTROLLER.rightViewController = [[RightViewController alloc] init];
}


@end
