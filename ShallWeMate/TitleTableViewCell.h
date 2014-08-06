//
//  TitleTableViewCell.h
//  start
//
//  Created by 컴049 on 2014. 8. 1..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString *content;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
+ (TitleTableViewCell*) titleTableViewCell;
@end
