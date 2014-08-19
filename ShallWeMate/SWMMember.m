//
//  SWMMember.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMember.h"

@implementation SWMMember

- (NSString *) description {
    
    return [NSString stringWithFormat:@"{ \"mid\":\"%d\" , \"name\":\"%@\" , \"age\":\"%d\" , \"sex\":\"%d\" , \"job\":\"%@\" , \"nick\":\"%@\" , \"subwayStationCode\":\"%@\" , \"rent\":\"%d\" , \"guaranty\":\"%d\" , \"styles\":\"%@\" , \"fbid\":\"%@\" , \"token\":\"%@\" , \"rules\":\"%@\" , \"avgAge\":\"%d\" , \"allowsex\":\"%d\" } ", _mid, _name, _age, _sex, _job, _nick, _subwayStationCode, _rent, _guaranty, _styles, _fbid, _token, _rules, _avgAge, _allowsex];
    
}

@end
