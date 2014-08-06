//
//  MessageTableViewCell.h
//  start
//
//  Created by 컴038 on 8/1/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgListTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *providerName;
@property (strong, nonatomic) IBOutlet UILabel *houseDescription;
@property (strong, nonatomic) IBOutlet UIImageView *providerImage;

@end
