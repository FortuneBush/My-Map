//
//  MyPoint.h
//  MyMap
//
//  Created by swinglife on 13-11-17.
//  Copyright (c) 2013年 swinglife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MyPoint : NSObject <MKAnnotation>

//实现MKAnnotation协议必须要定义这个属性
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
//标题
@property (nonatomic,copy) NSString *title;

//初始化方法
-(id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString*)t;

@end
