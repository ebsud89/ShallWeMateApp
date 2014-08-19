//
//  SWMHouseRoleTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 14..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMHouseRoleTableViewCell : UITableViewCell
+ (CGFloat) getHeight;
- (IBAction)finishClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *firstBtn;
@property (strong, nonatomic) IBOutlet UILabel *secondBtn;
@property (strong, nonatomic) IBOutlet UILabel *thirdBtn;
@property (strong, nonatomic) IBOutlet UILabel *fifthBtn;
@property (strong, nonatomic) IBOutlet UILabel *sixBtn;

@property (strong, nonatomic) NSMutableArray *houseRule;
@end
