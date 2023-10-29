//
//  MyPoint.m
//  MyMap
//
//  Created by swinglife on 13-11-17.
//  Copyright (c) 2013年 swinglife. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

-(id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t{
    self = [super init];
    if(self){
        _coordinate = c;
        _title = t;
    }
    return self;
}

@end
