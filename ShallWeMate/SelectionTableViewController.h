//
//  SelectionTableViewController.h
//  start
//
//  Created by 컴049 on 2014. 7. 23..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectionTableViewDelegate;

@interface SelectionTableViewController : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) int numberOfRowsInSection;
@property (nonatomic, assign) id<selectionTableViewDelegate> delegate;

@property (nonatomic, assign) UITableView *selectTableView;

@end

@protocol selectionTableViewDelegate <NSObject>

@required
- (void) didSelectedItem:(NSIndexPath *) indexPath;
- (void) didDeSelectedItem:(NSIndexPath *) indexPath;

@end