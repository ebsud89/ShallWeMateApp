//
//  SWMSubwayViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubwayViewControllerDelegate;

@interface SWMSubwayViewController : UIViewController

{
NSMutableArray *subwayStationArray;

NSMutableArray *subwayStationNameArray;
NSArray *searchResults;

//    id<SubwayViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id<SubwayViewControllerDelegate>delegate;

@property (strong, nonatomic) IBOutlet UISearchBar *subwaySearchBar;
@property (strong, nonatomic) IBOutlet UITableView *subwayTableView;

@property (strong, nonatomic) NSMutableArray *subwayArray;

- (void)initSubwayArray;
@end

@protocol SubwayViewControllerDelegate <NSObject>;

@required
- (void) didSelectedSubwayStation:(NSString *) text;
@end