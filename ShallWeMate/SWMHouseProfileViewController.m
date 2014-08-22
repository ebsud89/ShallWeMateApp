//
//  SWMHouseProfileViewController.m
//  ShallWeMate
//
//  Created by 컴038 on 8/22/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

//
//  SWMRegisterSummeryViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMHouseProfileViewController.h"
#import "BasicSearchTableViewCell.h"
#import "CollectionViewTableViewCell.h"
#import "SWMMateInfoTableViewCell.h"
#import "SWMHouseRoleTableViewCell.h"
#import "NSUserDefaults+RMSaveCustomObject.h"	


@implementation SWMHouseProfileViewController
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
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _memberData = [defaults rm_customObjectForKey:@"myHouse"];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"BasicSearchTableViewCell" bundle:nil] forCellReuseIdentifier:@"basicSearchTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"collectionViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMMateInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"swmMateInfoTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMHouseRoleTableViewCell" bundle:nil] forCellReuseIdentifier:@"swmHouseRoleTableViewCell"];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuBtnClicked:(id)sender {
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return [BasicSearchTableViewCell getHeight];
    }
    else if(indexPath.row == 1){
        return [CollectionViewTableViewCell getHeight];
    }
    else if(indexPath.row == 2){
        return [SWMMateInfoTableViewCell getHeight];
    }
    else if (indexPath.row == 3){
        return [SWMHouseRoleTableViewCell getHeight];
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
    
    return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        BasicSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicSearchTableViewCell"];
        
        //        cell setSearchLocationLabel:self.memberData.se
        NSLog(@"%@", _memberData.monthlyRentCost);
        [cell setSecurityCostMaxText:_memberData.securityCost];
        [cell setMonthlyCostMaxText:_memberData.monthlyRentCost];
        [cell setSearchLocationText:_memberData.nearSubwayStation];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==1)
    {
        SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"클남~~~");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"라이프 스타일 키워드"];
        [cell setTintColor:[UIColor darkGrayColor]];
        [cell setLifestyle:_memberData.enableLifeStyle];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        appDelegate.data = @"lifestyle";
        NSLog(@"%@", _memberData.enableLifeStyle );
        return cell;
    }
    else if (indexPath.row ==2)
    {
        SWMMateInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmMateInfoTableViewCell"];
        [cell setAvgAge:_memberData.avgAge];
        if ([_memberData.allowsex isEqualToString:@"0"]) {
            [cell setGender:@"동성만"];
        } else if ([_memberData.allowsex isEqualToString:@"1"]) {
            [cell setGender:@"상관없어요"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 3)
    {
        SWMHouseRoleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmHouseRoleTableViewCell"];
        [cell setHouseRule:_memberData.enableHouseRoles];
        NSLog(@"%@", _memberData.enableHouseRoles);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else
    {
        return nil;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.contentView.backgroundColor = [UIColor clearColor];
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
