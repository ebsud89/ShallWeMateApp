//
//  MsgTableViewController.h
//  start
//
//  Created by 컴038 on 8/1/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgListTableViewController : UITableViewController
{
    NSArray *myArray;
}
@property(strong, nonatomic) NSArray* myArray;
@property(strong, nonatomic) NSMutableArray *dataSourceArray;

@end
