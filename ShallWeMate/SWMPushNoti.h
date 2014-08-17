//
//  SWMPushNoti.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMPushNoti : NSObject

@property int pid;
@property int mid;
@property (nonatomic, strong) NSString *text;
@property int opt;
@property int noti;

@property (nonatomic, strong) NSString *udid;
@end
