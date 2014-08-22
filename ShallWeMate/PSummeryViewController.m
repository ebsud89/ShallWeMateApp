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
#import "SWMManagementTableViewCell.h"
#import "SWMRoom.h"

#import "UIViewController+LoadingOverlay.h"

#define swmServerAddr @"http://54.249.103.4/SWMserver"
#define swmServerAddrLocal @"http://54.249.103.4/SWMserver"

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
    SWMRoom *room = _houseData.exportToSWMRoom;
    NSLog(@"\n=======\ndescription test %@",room.description);

    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMImageScrollTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageScrollViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMTransportTableViewCell" bundle:nil] forCellReuseIdentifier:@"transportTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"TitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"titleTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"ManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"managementTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"CollectionViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"collectionViewTableViewCell"];
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"mcollectionViewTableViewCell"];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    
    
    [self.houseData printAll];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    [[[self navigationController] navigationBar] setBackgroundColor:[UIColor colorWithRed:174/255.0 green:70/255.0 blue:115/255.0 alpha:1]];
}


//- (IBAction)finishButtonClicked:(id)sender {
//    
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//}



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
    else if (indexPath.row == 3)
    {
        return [SWMManagementTableViewCell getHeight];
    }
    else if (indexPath.row == 4){
        return [SWMTransportTableViewCell getHeight];
    }
    else if (indexPath.row == 5){
        return [CollectionViewTableViewCell getHeight];
    }
    else if (indexPath.row == 6)
    {
        return [SWMManagementTableViewCell getHeight];
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
    return 7;
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
        [cell setManagementCost:self.houseData.managementCost];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row ==3)
    {
        
        SWMManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mcollectionViewTableViewCell"];
        
//        if (cell == nil) {
//            NSLog(@"hh");
//            cell = [SWMManagementTableViewCell collectionViewTableViewCell];
//        }
        [cell setTitle:@"관리비 포함 사항"];
        [cell setManagements:_houseData.enableManagementStates];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else if (indexPath.row == 4)
    {
        SWMTransportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transportTableViewCell"];
        
        [cell setSubwayDictionary:self.houseData.subwayDic];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else if (indexPath.row == 5)
    {
        CollectionViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionViewTableViewCell"];
        
        if (cell == nil) {
            NSLog(@"hh");
            cell = [CollectionViewTableViewCell collectionViewTableViewCell];
        }
        [cell setTitle:@"라이프 스타일 키워드"];
        [cell setLifestyle:_houseData.enableLifeStyle];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else if (indexPath.row == 6)
    {
        SWMManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mcollectionViewTableViewCell"];
        
        [cell setTitle:@"제공되는 옵션"];
        [cell setOption:_houseData.enableOptions];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else
    {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleTableViewCell"];
        
        if (cell == nil) {
            cell = [TitleTableViewCell titleTableViewCell];
        }
        
        [cell setTitle:@" "];
        [cell setContent:@" "];
        
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



- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishedClicked:(id)sender {
    
    
    
    
    [self showLayer:@"MESSAGE TO SHOW"];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *mode = [NSNumber numberWithBool:NO];
    [defaults setObject:mode forKey:@"AppMode"];
    
    [self performSelector:@selector(onHideLayer) withObject:nil afterDelay:5.0f];
    
    [self sendToRoomData];
    

}


- (void)onHideLayer
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self hideLayer];
}

#pragma mark - Network
- (void) sendToRoomData
{
    NSURL *url = [NSURL URLWithString:[swmServerAddr stringByAppendingString:@"/comm/CompareWithRoom"]];
    NSLog(@"URL : %@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // *data 에 Member 정보에 대한 JSON string 담으면 됨
    //    NSString *data = @"rid=135";
    NSLog(@"%@", [self.houseData description]);
    NSString *data = [self.houseData description];
    NSLog(@"%@", data);
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
}

@end
