//
//  SWMHouseProfileViewController.h
//  ShallWeMate
//
//  Created by 컴038 on 8/22/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberData.h"

@interface SWMHouseProfileViewController  :UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@property (weak, nonatomic) MemberData *memberData;

@end
