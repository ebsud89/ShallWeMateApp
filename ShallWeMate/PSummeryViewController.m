//
//  PSummeryViewController.m
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PSummeryViewController.h"
#import "CollectionViewTableViewCell.h"
#import "TitleTableViewCell.h"
#import "ManagementTableViewCell.h"
#import "SWMImageScrollTableViewCell.h"
#import "SWMTransportTableViewCell.h"

@interface PSummeryViewController ()

@end

@implementation PSummeryViewController

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
    

    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMImageScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageScrollViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMTransportTableViewCell" bundle:nil] forCellReuseIdentifier:@"transportTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"titleTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"ManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"managementTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"collectionViewTableViewCell"];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    
    
    [self.houseData printAll];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:112.0/255.0 green:43.0/255.0 blue:102.0/255.0 alpha:1000]];
}


- (IBAction)finishButtonClicked:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
        return [SWMTransportTableViewCell getHeight];
    }
    else if (indexPath.row == 4){
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 5)
    {
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
    return 6;
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
    else if (indexPath.row == 1){
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleTableViewCell"];

        if (cell == nil) {
            cell = [TitleTableViewCell titleTableViewCell];
        }
        
        [cell setTitle:self.houseData.title];
        [cell setContent:self.houseData.introHouse];
        
        return cell;
    }
    else if (indexPath.row ==2)
    {
        ManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"managementTableViewCell"];
        
        [cell setMonthlyCost:self.houseData.monthlyRentCost];
        [cell setSecurityCost:self.houseData.securityCost];
        [cell setManagementCost:self.houseData.securityCost];
        
        return cell;
    }
    else if (indexPath.row ==3)
    {
        SWMTransportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transportTableViewCell"];
        
        [cell setSubwayDictionary:self.houseData.subwayDic];
        return cell;
    }
    else if (indexPath.row == 4)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"xkdlxmfxkdlfxmf"];
        
        return cell;
    }
    else if (indexPath.row == 5)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"xkdlxmfxkdlfxmf"];
        
        return cell;
    }
    else
    {
        ManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"managementTableViewCell"];
        
        [cell setMonthlyCost:self.houseData.monthlyRentCost];
        [cell setSecurityCost:self.houseData.securityCost];
        [cell setManagementCost:self.houseData.securityCost];
        
        return cell;
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
