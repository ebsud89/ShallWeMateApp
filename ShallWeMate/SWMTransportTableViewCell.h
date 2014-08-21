//
//  SWMTransportTableViewCell.h
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 16..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWMTransportTableViewCell : UITableViewCell
+ (CGFloat) getHeight;

@property (strong, nonatomic) NSDictionary *subwayDictionary;
@property (strong, nonatomic) IBOutlet UILabel *subwayStationName;
@property (weak, nonatomic) IBOutlet UILabel *how;
@property (weak, nonatomic) IBOutlet UILabel *minutes;

@end
