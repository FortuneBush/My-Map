//
//  Position.m
//  MyMap
//
//  Created by wyb on 23-5-12.
//  Copyright (c) 2023年 wyb. All rights reserved.
//

#import "Position.h"

@implementation Position

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    self = [super init];
    if(self){
        _coordinate = c;
        _title = t;
    }
    return self;
}

@end
