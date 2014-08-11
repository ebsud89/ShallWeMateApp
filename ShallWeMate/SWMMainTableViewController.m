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
    
    
    
    //덤프 데이터 만들기
    MakeDumpData *dump = [[MakeDumpData alloc]init];
    dataSourceArray = [[NSMutableArray alloc]initWithArray:[dump getHouseDataArray]];
    
    int i = (int) [self.dataSourceArray count];
    NSLog(@"데이터 테이블 갯수 : %d", i);
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"Clicked YES");
        
    }
    else if (buttonIndex == 1) {
        NSLog(@"Clicked NO");
    }
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
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

static NSString *reuseIdentifier = @"ReuseableMainTableCellWithIdentifier";
SWMMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];


// Configure the cell...

if (cell == nil) {
    NSLog(@"Cell is nil");
}

HouseData *houseData = [dataSourceArray objectAtIndex:indexPath.row];

NSLog(@"houseData %@", houseData.title);
cell.titleLabel.text = houseData.title;
cell.subTitleLabel.text = houseData.subTitle;
cell.priceLabel.text = [NSString stringWithFormat:@"%lu 만원", (unsigned long)houseData.price];

int i = (int)[houseData.houseImageArray count];
NSLog(@"이미지 개수 : %d", i);

[cell setHouseImageArray:houseData.houseImageArray];

return cell;

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

@end
