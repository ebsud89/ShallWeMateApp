//
//  SWMRegisterSummeryViewController.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 12..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberData.h"

@interface SWMRegisterSummeryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@property (weak, nonatomic) MemberData *memberData;
@end
