//
//  MsgTableViewController.m
//  start
//
//  Created by 컴038 on 8/1/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "MsgListTableViewController.h"
#import "MsgListTableCell.h"
#import "MsgContentsViewController.h"
#import "MakeDumpData.h"
#import "HouseData.h"

@implementation MsgListTableViewController
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
    
    
    
    
    //덤프 데이터 만들기
    MakeDumpData *dump = [[MakeDumpData alloc]init];
    dataSourceArray = [[NSMutableArray alloc]initWithArray:[dump getHouseDataArray]];
//
//    int i = (int) [self.dataSourceArray count];
    
    //cursor color
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
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
    
    return (int) [self.dataSourceArray count];
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
    
    static NSString *reuseIdentifier = @"ReuseableMsgTableCellWithIdentifier";
    MsgContentsViewController *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    
    if (cell == nil) {
        NSLog(@"Cell is nil");
    }
    
    HouseData *houseData = [dataSourceArray objectAtIndex:indexPath.row];
    
//    NSLog(@"houseData %@", houseData.title);
    
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//
//    if ([[segue identifier] isEqualToString:@"MainTableIdentifier"]) {
//        MainDetailViewController *vc = [segue destinationViewController];
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSLog(@"%d 번째 셀이 선택되었습니다.", (int) indexPath.row);
//        HouseData *houseData = [dataSourceArray objectAtIndex:indexPath.row];
//        [vc setHouseImageArray:houseData.houseImageArray];
//        vc.myTitle = houseData.title;
//
//    }
//}

@end
