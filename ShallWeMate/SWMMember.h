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
@property int sex;
@property int job;

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *nick;

@property int opt;
@property (strong, nonatomic) NSString *styles;

@property int role;

@property (strong, nonatomic) NSString *fbid;
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *rules;

@property int allowsex;

- (NSString *) description;
@end
