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
UIImageView *imgView;

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
   
    
    static NSString *reuseIdentifier = @"ReuseableMsgTableCellWithIdentifier";
    MsgContentsViewController *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    imgView.image = [UIImage imageNamed:@"face_test.png"];
    
    imgView.layer.cornerRadius = imgView.frame.size.width / 2;
    imgView.clipsToBounds = YES;
    
    // Configure the cell...
    
    if (cell == nil) {
        NSLog(@"Cell is nil");
    }
    
    
    return cell;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (IBAction)menuBtnClicked:(id)sender {
    NSLog(@"button is touched");
    [MENU_VIEW_CONTROLLER openLeftSideViewControllerAnimated:YES completion:nil];
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
