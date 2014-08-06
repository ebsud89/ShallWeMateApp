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
    
    subwayStationArray = [[NSMutableArray alloc]initWithArray:nil];
    subwayStationNameArray = [[NSMutableArray alloc]initWithArray:nil];
    
    for (NSString *item in contentArray) {
        NSArray *itemArray = [item componentsSeparatedByString:@","];
        //        NSLog(@"%@",[itemArray objectAtIndex:1]);
        [subwayStationNameArray addObject:[itemArray objectAtIndex:1]];
        // log first item
        [subwayStationArray addObject:itemArray];
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [subwayStationNameArray filteredArrayUsingPredicate:resultPredicate];
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
        return [subwayStationArray count];
    }
    return [subwayStationArray count];
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
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else {
        NSArray *arr = [subwayStationArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [arr objectAtIndex:1];
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
        
        NSString *str = [searchResults objectAtIndex:index.row];
        [self.delegate didSelectedSubwayStation:str];
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
