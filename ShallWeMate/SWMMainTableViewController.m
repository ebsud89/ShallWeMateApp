//
//  SWMMainTableViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMainTableViewController.h"
#import "SWMMainTableViewCell.h"
#import "SWMMainDetailViewController.h"
#import "MakeDumpData.h"
#import "HouseData.h"
#import "RegisterViewController1.h"
#import "SWMHouseImageTableViewCell.h"
#import "SWMNetwork.h"
#import "MemberData.h"

#define swmServerAddr @"http://54.249.103.4/SWMserver/"
#define swmServerAddrLocal @"http://54.249.103.4/SWMserver/"

@interface SWMMainTableViewController ()

@end

@implementation SWMMainTableViewController

@synthesize dataSourceArray;
@synthesize myArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*
     여기서 초기화 ....
     밑에 소스 코드가 아무 값으로 이루어진 dataSourceArray 만드는 거입니당~
     여기서 서버에서 받아와서, HouseData타입의 배열을 만들 때 사용하면 됩니다.
     */
    
    dataSourceArray = [[NSMutableArray alloc]init];
    SWMNetwork *network = [[SWMNetwork alloc]init];
    NSArray *roomArray = [network getAllRooms];
    for (NSDictionary *dic in roomArray) {
        SWMRoom *room = [[SWMRoom alloc]initWithDictionary:dic];
        NSLog(@"\n%@", room);
        HouseData * houseData = [room exportToHouseData];
        [dataSourceArray addObject:houseData];
        
    }
    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SWMHouseImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"houseImageTableViewCell"];
    
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
        [self loadData];
}

- (void) loadData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    NSLog(@"%@",[defaults objectForKey:@"forSearchMemberData"]);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self viewDidLoad];
        
    }
    else if (buttonIndex == 1) {
        
        UIViewController *privacy = [self.storyboard instantiateViewControllerWithIdentifier:@"registerNav"];
        
        // present
        [self presentViewController:privacy animated:YES completion:nil];
        
    }
}


- (IBAction)menuButtonClicked:(id)sender {
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [dataSourceArray count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SWMHouseImageTableViewCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 /*
 
 여기서 셀을 재활용 하여 생산함.
 
 셀이 화면에 보일 때 마다 여기를 뺑뺑 돌음... ㅋㅋㅋ
 
 추측컨데... (이래도 되나....요......)
 
 여기서 일정한 수 만큼 셀을 만들고,
 
 화면 밖으로 밀려 나면, 데이터만 싹 바꿔서 다시 재활용하는듯....
 
 */

//     static NSString *reuseIdentifier = @"ReuseableMainTableCellWithIdentifier";
//     SWMMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
//     
//     
//     // Configure the cell...
//     
//     if (cell == nil) {
//         NSLog(@"Cell is nil");
//     }
//     
//     HouseData *houseData = [dataSourceArray objectAtIndex:indexPath.row];
//     
//     NSLog(@"houseData %@", houseData.title);
//     cell.titleLabel.text = houseData.title;
//     cell.subTitleLabel.text = houseData.subTitle;
//     cell.priceLabel.text = [NSString stringWithFormat:@"%lu 만원", (unsigned long)houseData.price];
//     
//     int i = (int)[houseData.houseImageArray count];
//     NSLog(@"이미지 개수 : %d", i);
//     
//     [cell setHouseImageArray:houseData.houseImageArray];
//     
//     return cell;

     SWMHouseImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"houseImageTableViewCell" forIndexPath:indexPath];
     
//     SWMHouseImageTableViewCell *cell = [[SWMHouseImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"houseImageTableViewCell"];
     
     HouseData *housedata = [dataSourceArray objectAtIndex:indexPath.row];
     NSLog(@"%@", housedata);
//     NSLog(@"%d", housedata.title);
     [cell setTitleText:housedata.title];
     
     [cell setIsMainTableView:YES with:housedata];
     
     [cell setEnabledBadgeView];
     [cell setEnabledLikeIt:housedata.likeIt with:YES];
     
     UITapGestureRecognizer *oneFingerOneTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneFingerOneTap:)];
     
     [oneFingerOneTap setNumberOfTapsRequired:1];
     [oneFingerOneTap setNumberOfTouchesRequired:1];
     
     [cell.contentView addGestureRecognizer:oneFingerOneTap];
     
     

//     UITapGestureRecognizer *oneFingerTwoTaps =
//     [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps:)] ;
//     
//     // Set required taps and number of touches
//     [oneFingerTwoTaps setNumberOfTapsRequired:2];
//     [oneFingerTwoTaps setNumberOfTouchesRequired:1];
//     
//     // Add the gesture to the view
//     [cell.imageScrollView addGestureRecognizer:oneFingerTwoTaps];

     
     // Configure the cell...
     [cell viewWithTag:indexPath.row];
     return cell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWMHouseImageTableViewCell *myCell = (SWMHouseImageTableViewCell*) cell;
    
    [myCell refreshUI];
}

- (void) oneFingerTwoTaps:(UISwipeGestureRecognizer *)gestureRecognizer
{
        NSLog(@"Action : One Finger, Two Taps");
//    //Get location of the swipe
//    CGPoint location = [gestureRecognizer locationInView:self.tableView];
//    
//    //Get the corresponding index path within the table view
//    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    //Check if index path is valid
//    if(indexPath)
//    {
//        //Get the cell out of the table view
//        SWMHouseImageTableViewCell *cell = (SWMHouseImageTableViewCell *) [self.tableView cellForRowAtIndexPath:indexPath];
//        
//        [cell openBadge];
//    }
}

- (void) oneFingerOneTap:(UISwipeGestureRecognizer *)gestureRecognizer
{
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    
    //Get the corresponding index path within the table view
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];

    NSLog(@"Action : One Finger, One Taps");
    
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"%d 번째 셀이 선택되었습니다.", (int) indexPath.row);
    
    [self performSegueWithIdentifier:@"MainTableIdentifier" sender:self];
    
}
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath
{
    NSLog(@"dddddddd didididi");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchButtonTouched:(id)sender {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"초기하우스 검색설정으로 돌아가서 수정합니다."
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes",nil];
        [alert show];
    
    
}

#pragma mark - Network
- (void) sendToServerWithRoomID
{
    //    NSURL *url = [NSURL URLWithString:[kServerAddrUpload stringByAppendingString:@"test"]];
    //    [url URLByAppendingPathComponent:@"/test"];
    
    NSURL *url = [NSURL URLWithString:[swmServerAddr stringByAppendingString:@"getRoomDetail"]];
    NSLog(@"URL : %@", url);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // *data 에 선택한 방에 대한 rid 정보를 JSON 형식으로 넣어주면 되
    NSString *data = @"";
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    // connect server
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"error = %@", error);
    
    NSString *text = [error localizedDescription];
}

- (void)connection:(NSURLConnection *)connection
didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSLog(@"%s", __FUNCTION__);
    
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
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s", __FUNCTION__);
}

@end
