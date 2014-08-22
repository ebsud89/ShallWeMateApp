//
//  SWMLikeItListViewController.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 15..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMLikeItListViewController.h"
#import "SWMHouseImageTableViewCell.h"

@interface SWMLikeItListViewController ()

@end

@implementation SWMLikeItListViewController

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
    
    houseDataArray = [[NSMutableArray alloc]init];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"SWMHouseImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"houseImageTableViewCell"];
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
    return 10;
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
    [cell viewWithTag:9999999];
    return cell;
}

- (void) oneFingerOneTap:(UISwipeGestureRecognizer *)gestureRecognizer
{
    CGPoint location = [gestureRecognizer locationInView:self.contentTableView];
    
    //Get the corresponding index path within the table view
    NSIndexPath *indexPath = [self.contentTableView indexPathForRowAtPoint:location];
    
    NSLog(@"Action : One Finger, One Taps");
    
    //    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"%d 번째 셀이 선택되었습니다.", (int) indexPath.row);
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"swmMainDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
//    [self performSegueWithIdentifier:@"MainTableIdentifier" sender:self];
    
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
