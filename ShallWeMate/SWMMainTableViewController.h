//
//  SWMMainTableViewController.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMMainTableViewController : UITableViewController

{
    NSArray *myArray;
}
@property(strong, nonatomic) NSArray* myArray;
@property(strong, nonatomic) NSMutableArray *dataSourceArray;


@end