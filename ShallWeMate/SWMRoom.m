//
//  SWMRoom.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMRoom.h"

@implementation SWMRoom

- (NSString *) description {
    return [NSString stringWithFormat:@"{\"rid\":\"%d\", \"name\":\"%@\", \"rent\":\"%d\", \"guaranty\":\"%d\", \"management\":\"%d\", \"infos\":\"%@\", \"options\":\"%@\", \"styles\":\"%@\", \"rules\":\"%@\", \"premium\":\"%d\", \"total\":\"%d\", \"available\":\"%d\" , \"wsex\":\"%d\", \"msex\":\"%d\", \"time\":\"%d\", \"way\":\"%d\" ", _rid, _name, _rent, _guaranty, _management, _infos, _options, _styles, _rules, _premium, _total, _available, _wsex, _msex, _time, _way];
}

@end
