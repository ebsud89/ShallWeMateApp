//
//  SWMSubwayViewController.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMSubwayViewController.h"

@interface SWMSubwayViewController ()

@end

@implementation SWMSubwayViewController

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

    [self initSubwayArray];
    
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

- (void)initSubwayArray
{
    NSLog(@"initsubwayArray 초기화...");
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"subway"
                                                     ofType:@"csv"];
    NSString *content =  [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *contentArray = [content componentsSeparatedByString:@"\n"];
    
//    subwayStationArray = [[NSMutableArray alloc]initWithArray:nil];
//    subwayStationNameArray = [[NSMutableArray alloc]initWithArray:nil];
    
    subwayDicArray = [[NSMutableArray alloc]init];
    
//    NSString *item = [contentArray objectAtIndex:0];
//    NSArray *indexArray = [item componentsSeparatedByString:@","];
    
//    전철역코드,전철역명,호선,외부코드
    for (NSString *item in contentArray) {
        NSArray *itemArray = [item componentsSeparatedByString:@","];
        
        NSDictionary *subwayDic = [[NSDictionary alloc]initWithObjectsAndKeys:
        [itemArray objectAtIndex:0], @"전철역코드",
        [itemArray objectAtIndex:1], @"전철역명",
        [itemArray objectAtIndex:2], @"호선",
        [itemArray objectAtIndex:3], @"외부코드", nil];
        
        [subwayDicArray addObject:subwayDic];
        
        [self.subwaySearchBar sizeToFit];
        self.searchDisplayController.delegate = self;
        
        //        NSLog(@"%@",[itemArray objectAtIndex:1]);
//        [subwayStationNameArray addObject:[itemArray objectAtIndex:1]];
//        // log first item
//        [subwayStationArray addObject:itemArray];
    }
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView  {
    
    tableView.frame = self.subwayTableView.frame;
    
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@",@"전철역명",searchText];
    
    searchResults = [subwayDicArray filteredArrayUsingPredicate:predicate];
    
//    NSLog(@"%@", filteredKeys);
    
//    NSPredicate *resultPredicate = [NSPredicate
//                                    predicateWithFormat:@"SELF contains[cd] %@",
//                                    searchText];
//    
//    searchResults = [subwayStationNameArray filteredArrayUsingPredicate:resultPredicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else {
        return [subwayDicArray count];
    }
    return [subwayDicArray count];
}

//user tapped on the cancel button
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    NSLog(@"User canceled search");
    [searchBar resignFirstResponder];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"subwayCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"subwayCell"];
    }
    
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
        NSMutableDictionary *dic = [searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text= [dic objectForKey:@"전철역명"];
    }
    else {
        NSMutableDictionary *dic = [subwayDicArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [dic objectForKey:@"전철역명"];
//        NSArray *arr = [subwayStationArray objectAtIndex:indexPath.row];
//        cell.textLabel.text = [arr objectAtIndex:1];
    }
    
    
    
    UIImage *img = [UIImage imageNamed:@"makefg.php.png"];
    [cell.imageView setBackgroundColor:[UIColor blueColor]];
    cell.imageView.image = img;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    NSLog(@"%d", self.navigationController.searchDisplayController.active); ->0
    //    NSLog(@"%d", self.searchDisplayController.active); ->1
    
    NSIndexPath *index;
    
    if (self.searchDisplayController.active) {
        index = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        
        NSMutableDictionary *dic = [searchResults objectAtIndex:index.row];
        [self.delegate didSelectedSubwayStation:[dic objectForKey:@"전철역명"]];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        index = [self.subwayTableView indexPathForSelectedRow];
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
