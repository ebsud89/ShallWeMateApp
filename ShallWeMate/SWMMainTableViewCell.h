//
//  SWMMainTableViewCell.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMMainTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *likeLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *peopleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *houseImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *houseScrollView;
@property (setter = setHouseImageArray:, nonatomic) NSArray *houseImageArray;


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end
