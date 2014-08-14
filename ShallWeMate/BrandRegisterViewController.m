//
//  BrandRegisterViewController.m
//  start
//
//  Created by 컴038 on 8/4/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "BrandRegisterViewController.h"
#import "BrandRegisterViewController2.h"
#import "BrandRegisterViewCell.h"

@implementation BrandRegisterViewController

@synthesize brandName;
@synthesize brandImage;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.brandName = [[NSArray alloc]
                       initWithObjects:@"woozoo", @"Green",
                       @"Blue", @"Indigo", @"Violet", nil];
    NSArray *picArray = [[NSArray alloc] initWithObjects:@"makefg.php.png", @"face_test.png", @"face_test.png", @"face_test.png",
                         @"face_test.png",nil];
    self.picData = picArray;
    
   
    [picArray release];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.brandName count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *tvcell = [tableView
//                             dequeueReusableCellWithIdentifier:CellIdentifier];
    BrandRegisterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[BrandRegisterViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    cell.brandName.text = [self.brandName
                           objectAtIndex: [indexPath row]];
    
//    cell.brandImage.image = [UIImage imageNamed:[picData objectAtIndex:indexPath.row]];
    //
    UIImage *woozooImage = [UIImage imageNamed:@"makefg.php.png"];
    UIImage *othersImage = [UIImage imageNamed:@"face_test.png"];
    
    switch (indexPath.row) {
        case 0:
            cell.brandImage.image = woozooImage;
            brandImage = woozooImage;
            break;
            
        default:
            cell.brandImage.image = othersImage;
            brandImage = othersImage;
            break;
    }
    
//    NSString *subtitle = [NSString stringWithString:
//                          @"All about the color "];
//    subtitle = [subtitle stringByAppendingString:colorString];
//    cell.detailTextLabel.text = subtitle;
    return cell;
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.brandName = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"brandRegisterSegue"]) {
        BrandRegisterViewController2 *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSLog(@"%d 번째 셀이 선택되었습니다.", (int) indexPath.row);
//        HouseData *houseData = [dataSourceArray objectAtIndex:indexPath.row];
//        [vc brandImage:];
//        vc.brandImage = brandImage;//picData[indexPath.row];
        vc.brandNameString = brandName[indexPath.row];
        NSLog(@"brand name : %@", brandName[indexPath.row]);
        _houseData.premium = brandName[indexPath.row];
        NSLog(@"brand name2 : %@",  _houseData.premium);
        vc.houseData = _houseData;
        
    }
}
- (IBAction)backButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
