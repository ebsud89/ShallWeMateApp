//
//  SWMMember.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMMember : NSObject

@property int mid;
@property (strong, nonatomic) NSString *name;
@property int age;
@property int sex;//남자는 0 여자는 1
@property  (strong, nonatomic) NSString *job; //int ->nsstring


//@property (strong, nonatomic) NSString *email;
//@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *nick;//subwayStationName;..?
//@property (strong, nonatomic) NSString * subwayStationName;
@property (strong, nonatomic) NSString * subwayStationCode;
@property int rent;
@property int guaranty;

//@property int opt;
@property (strong, nonatomic) NSString *styles;

//@property int role;

@property (strong, nonatomic) NSString *fbid;
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *rules;
@property int avgAge;
@property int allowsex; //동성만0 혼성1

- (NSString *) description;
@end
