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
UIImageView *image;

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
    
//    [self.searchBar setShowsCancelButton:NO animated:NO];
    
    NSArray *picArray = [[NSArray alloc] initWithObjects:@"01.png",@"02.png",@"03.png",@"04.png",@"05.png",@"06.png",@"07.png",@"08.png",@"09.png",@"경의.png",@"경춘.png",@"공항.png",@"분당.png",@"수인.png",@"신분당.png",@"에버.png",@"의정부.png",@"인천.png",@"중앙.png",nil];
    self.picData = picArray;
    
    
    self.subwaySearchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.subwaySearchBar.placeholder = @"지하철역명을 입력하세요.";

    [self.navigationController setTitle:@"역 검색"];
    
    id barButtonAppearanceInSearchBar = [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil];
    
//    [barButtonAppearanceInSearchBar setBackgroundImage:grayBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barButtonAppearanceInSearchBar setTitleTextAttributes:@{
                                                             UITextAttributeFont : [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:16],
                                                             UITextAttributeTextColor : [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]
                                                             } forState:UIControlStateNormal];
    [barButtonAppearanceInSearchBar setTitle:@"취소"];
    


    
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    NSLog(@"aa");
    

    
}

//-(void)layoutSubviews{
//    [super layoutSubviews];
//    [self setShowsCancelButton:NO animated:NO];
//}

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
    
    subwayDicArray = [[NSMutableArray alloc]init];
    
    
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
//        self.subwayTableView.delegate =self;
//        self.subwayTableView.dataSource = self;
    }
    
    self.searchDisplayController.displaysSearchBarInNavigationBar = NO;
//    self.searchDisplayController.searchResultsTableView.frame = CGRectMake(0.0f, 0.0f, 320.0f, 460.0f);;
    self.navigationController.navigationBarHidden = NO;


}




- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@",@"전철역명",searchText];
    
    searchResults = [subwayDicArray filteredArrayUsingPredicate:predicate];
    
    
    NSMutableArray *tempArry =[[NSMutableArray alloc]initWithArray:[subwayDicArray filteredArrayUsingPredicate:predicate]];
////    NSArray *tempArray2;
//    subwayTransformArray = [[NSMutableArray alloc]init];
//    
    for (int i=0; i< [tempArry count]; i++) {
        NSMutableDictionary *myDic = [tempArry objectAtIndex:i];
        NSString *myStr = [myDic objectForKey:@"전철역명"];
        NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"%K MATCHES[c] %@",@"전철역명", myStr];
        
        //    searchResults = [subwayDicArray filteredArrayUsingPredicate:predicate];
        NSMutableArray *myTempArry = [[NSMutableArray alloc]initWithArray:[tempArry filteredArrayUsingPredicate:predicate2]];
        
        if ([myTempArry count] >1) {
            NSMutableDictionary *tempDic = [myTempArry objectAtIndex:0];
            NSString *mergeDic = [tempDic objectForKey:@"호선"];
            NSLog(@"호선 : %@", mergeDic);
            
            for (int i=1; i<[myTempArry count]; i++) {
                NSMutableDictionary *temptempDic = [myTempArry objectAtIndex:i];
                
                NSString *firStr = [temptempDic objectForKey:@"호선"];
                mergeDic = [NSString stringWithFormat:@"%@/%@", mergeDic, firStr];
                
                [tempArry removeObject:temptempDic];
                
            }
//            [subwayTransformArray addObject:tempDic];
//            [subwayTransformArray addObject:tempDic];
            NSLog(@"호선 : %@", mergeDic);
            NSLog(@"%@", tempDic);
            
            NSDictionary *subwayDic2 = [[NSDictionary alloc]initWithObjectsAndKeys:
                                       [tempDic objectForKey:@"전철역코드"], @"전철역코드",
                                       [tempDic objectForKey:@"전철역명"], @"전철역명",
                                       mergeDic, @"호선",
                                       [tempDic objectForKey:@"외부코드"], @"외부코드", nil];
            
            [tempArry replaceObjectAtIndex:i withObject:subwayDic2];
//            [tempDic removeObjectForKey:@"호선"];
//            [tempDic setObject:mergeDic forKey:@"호선2"];
            
//            [tempDic objectForKey:@"호선"] = mergeDic;
        }
    }
    
    searchResults = tempArry;
//    searchResults = tempArry;
////    searchResults = tempArray2;
////    searchResults = subwayTransformArray;
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count is %ld", [searchResults count]);
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
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableDictionary *dic = [searchResults objectAtIndex:indexPath.row];
    
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
////            NSMutableDictionary *dic = [subwayDicArray objectAtIndex:indexPath.row];
////        cell.textLabel.text= [dic objectForKey:@"전철역명"];
//    }
//    else {
////    NSMutableDictionary *dic = [subwayDicArray objectAtIndex:indexPath.row];
////        cell.textLabel.text = [dic objectForKey:@"전철역명"];
//    }
//    
    
    
//    UIImage *img = [UIImage imageNamed:@"1호선_수정.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 84, 84)];
    //    [imgView setContentMode:UIViewContentModeCenter];
    //    self.data = [[NSArray alloc]
    //                      initWithObjects:@"cook\n요리", @"Green",
    //                 @"Blue", @"Indigo", @"Violet", @"Green",
    //                 @"Blue", @"Indigo", @"Violet", @"Green",
    //                 @"Blue", @"Indigo", @"Violet", @"Green",
    //                 @"Blue", @"Indigo", @"Violet", nil];
    

    NSString *subwayLine;
    subwayLine = [dic objectForKey:@"호선"];
    
    NSArray *contentArray = [subwayLine componentsSeparatedByString:@"/"];
    
    NSLog(@"%@", contentArray);
    
    for (int i=0; i<[contentArray count]; i++) {
        NSString *subStr = [contentArray objectAtIndex:i];
        NSString *subwayImage;
        
        if ([subStr isEqual:@"1"]) {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"2"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
            
        }
        else if ([subStr isEqual:@"3"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"4"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"5"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"6"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"7"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"8"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
        }
        else if ([subStr isEqual:@"9"])
        {
            subwayImage = [NSString stringWithFormat:@"0%@.png", subStr];
            
        }
        else if ([subStr isEqual:@"A"])
        {
            subwayImage = @"공항.png";
        }
        else if ([subStr isEqual:@"B"])
        {
            subwayImage = @"분당.png";
        }
        else if ([subStr isEqual:@"K"])
        {
            subwayImage = @"경의.png";
        }
        else if ([subStr isEqual:@"G"])
        {
            subwayImage = @"경춘.png";
        }
        else if ([subStr isEqual:@"SU"])
        {
            subwayImage = @"수인.png";
        }
        else if ([subStr isEqual:@"S"])
        {
            subwayImage = @"신분당.png";
        }
        //    else if ([subwayLine isEqual:@"G"])
        //    {
        //        subwayImage = @"에버.png";
        //    }
        //    else if ([subwayLine isEqual:@"H"])
        //    {
        //        subwayImage = @"의정부.png";
        //    }
        else if ([subStr isEqual:@"I"])
        {
            subwayImage = @"인천.png";
        }
        else if ([subStr isEqual:@"J"])
        {
            subwayImage = @"중앙.png";
        }
        else
        {
            subwayImage = nil;
        }
        
        NSLog(@"%@, %@",[dic objectForKey:@"전철역명"], [dic objectForKey:@"호선"]);
        
        if (cell.imageView.image == nil) {
            NSLog(@"nilnilnil");
            [cell.imageView setBackgroundColor:[UIColor clearColor]];
            
            cell.imageView.image = [UIImage imageNamed:subwayImage];
        }
        else
        {

            
            UIImageView *imView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:subwayImage]];
            imView.frame = CGRectMake(i*30, 0, imView.frame.size.width, imView.frame.size.height);
            
            
            [cell.imageView addSubview:imView];
            

        }
        
        if (i == [contentArray count]-1) {
            NSLog(@"뿅");
            //            cell.textLabel.frame = CGRectMake(i*30 +40, 0, cell.textLabel.frame.size.width, cell.textLabel.frame.size.height);
            UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake([contentArray count]*30 + 20, 2, 100, 40)];
            lb.text = [dic objectForKey:@"전철역명"];
            lb.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:15];
            lb.textColor = [UIColor darkGrayColor];
            [cell addSubview:lb];
            
            [cell reloadInputViews];
            //            [cell.contentView addSubview:lb];
        }

        
    }
    
    

    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSIndexPath *index;
    
    if (self.searchDisplayController.active) {
        index = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
        
        NSMutableDictionary *dic = [searchResults objectAtIndex:index.row];
//        [self.delegate didSelectedSubwayStation:[dic objectForKey:@"전철역명"]];
        [self.delegate didSelectedSubwayStation:dic];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        index = [self.subwayTableView indexPathForSelectedRow];
    }
}
-(void)viewWillLayoutSubviews
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


#pragma mark <UISearchDisplayDelegate>

- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{

    [self performSelector:@selector(removeOverlay) withObject:nil afterDelay:.001f];

    [self.navigationController setNavigationBarHidden:NO animated:NO];

}
- (void)removeOverlay
{
    UIView *myView = [self.view.subviews lastObject];
//    [[self.view.subviews lastObject] removeFromSuperview];
    myView.frame = CGRectMake(0.0f, 44.0f, 320.0f, 460.0f);;
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController
                                                *)controller {
    // Un-hide the navigation bar that UISearchDisplayController hid
//    [self.navigationController setNavigationBarHidden:NO];
    
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController
                                               *)controller {
    UISearchBar *searchBar = (UISearchBar *)self.navigationItem.titleView;
    
    // Manually resign search mode
    [searchBar resignFirstResponder];
    
    // Take back control of the search bar
//    searchBar.delegate = self;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView  {
    
    tableView.frame = CGRectMake(0.0f, 0.0f, 320.0f, 460.0f);;
    
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
