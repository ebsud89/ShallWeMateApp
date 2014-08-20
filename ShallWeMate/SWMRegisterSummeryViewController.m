//
//  SWMRegisterSummeryViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMRegisterSummeryViewController.h"
#import "BasicSearchTableViewCell.h"
#import "CollectionViewTableViewCell.h"
#import "SWMMateInfoTableViewCell.h"
#import "SWMHouseRoleTableViewCell.h"

#pragma mark - Server Address
#define swmServerAddr @"http://54.249.103.4/SWMserver"
#define swmServerAddrLocal @"http://54.249.103.4/SWMserver"

@interface SWMRegisterSummeryViewController ()

@end

@implementation SWMRegisterSummeryViewController

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

- (IBAction)finishedClicked:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//    SWMSummeryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SWMSummeryViewController"];
//    
//    vc.memberData = memberData;
//    [self.view addSubview:vc.view];
    
    UIView *overlayView = [[UIView alloc]initWithFrame:self.view.frame];
    overlayView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:overlayView];
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [self sendToMemberData];
    
    [self saveData];
    
}

- (void) saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    SWMMember *mem = [self.memberData exportToSWMMember];
    [defaults setObject:[mem description] forKey:@"forSearchMemberData"];
    
    [defaults synchronize];
}

#pragma mark - Netework
- (void) sendToMemberData
{
    NSURL *url = [NSURL URLWithString:[swmServerAddr stringByAppendingString:@"comm/CompareWithRoom"]];
    NSLog(@"URL : %@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // *data 에 Member 정보에 대한 JSON string 담으면 됨
    NSString *data = @"rid=135";
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%s", __FUNCTION__);
    
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"%s", __FUNCTION__);
    // 여기서 *data 가 연결 후에 받은 matched Room 에 대한 JSON 형태
    // getAllRoom 에서 받은 거 처럼 똑같이 처리하면 될거 같아.
    
    NSLog(@"%@", data);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"error = %@", error);
    
    NSString *text = [error localizedDescription];
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
        NSLog(@"%@", self.memberData.monthlyRentCost);
        [cell setSecurityCostMaxText:_memberData.securityCost];
        [cell setMonthlyCostMaxText:_memberData.monthlyRentCost];
        [cell setSearchLocationText:_memberData.nearSubwayStation];
        return cell;
    }
    else if (indexPath.row ==1)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"클남~~~");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"라이프 스타일 키워드"];
        [cell setTintColor:[UIColor darkGrayColor]];
        [cell setLifestyle:_memberData.enableLifeStyle];
        
        NSLog(@"%@", _memberData.enableLifeStyle );
        return cell;
    }
    else if (indexPath.row ==2)
    {
        SWMMateInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmMateInfoTableViewCell"];
        
        return cell;
    }
    else if (indexPath.row == 3)
    {
        SWMHouseRoleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"swmHouseRoleTableViewCell"];
        
        NSLog(@"%@", _memberData.enableHouseRoles);
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
