//
//  SWMPMateDetailViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMPMateDetailViewController.h"
#import "CollectionViewTableViewCell.h"
#import "SWMMateInfoTableViewCell.h"
#import "SWMHouseRoleTableViewCell.h"

@interface SWMPMateDetailViewController ()

@end

@implementation SWMPMateDetailViewController

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
- (IBAction)dismis:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"닫음");
    }];
}

#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 1)
    {
        return [SWMMateInfoTableViewCell getHeight];
    }
    else if (indexPath.row == 2)
    {
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
    return 3;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
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
    else if (indexPath.row == 1)
    {
        SWMMateInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmMateInfoTableViewCell"];
        
        return cell;
    }
    else if (indexPath.row == 2)
    {
        SWMHouseRoleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmHouseRoleTableViewCell"];
        
        return cell;
    }
    else
    {
        return nil;
    }
    
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
