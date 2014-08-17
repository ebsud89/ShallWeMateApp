//
//  SWMRoom.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMRoom : NSObject

@property int rid;
@property (strong, nonatomic) NSString *name;
@property int hostid;

@property int sid;
@property (strong, nonatomic) NSString *sname;
@property int rent;
@property int guaranty;
@property int management;

@property (strong, nonatomic) NSString *infos;
@property (strong, nonatomic) NSString *options;
@property (strong, nonatomic) NSString *styles;
@property (strong, nonatomic) NSString *rules;

@property int premium;

@property int total;
@property int available;
@property int wsex;
@property int msex;

@property int time;
@property int way;

- (id) initWithDictionary : (NSDictionary *)inpDic;
- (NSString *) description;

@end
