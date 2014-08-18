//
//  SWMSubwayViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubwayViewControllerDelegate;

@interface SWMSubwayViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

{
    NSArray *searchResults;
    
    NSMutableArray *subwayDicArray;
    
    NSMutableArray *subwayTransformArray;
    

//    id<SubwayViewControllerDelegate> delegate;
    
}

@property (nonatomic, assign) id<SubwayViewControllerDelegate>delegate;

@property (strong, nonatomic) IBOutlet UISearchBar *subwaySearchBar;
@property (strong, nonatomic) IBOutlet UITableView *subwayTableView;

@property (strong, nonatomic) NSArray *picData;
@property (strong, nonatomic) NSMutableArray *subwayArray;

- (void)initSubwayArray;
@end

@protocol SubwayViewControllerDelegate <NSObject>;

@required
- (void) didSelectedSubwayStation:(NSDictionary *) subwayDic;
@end