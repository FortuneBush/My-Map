//
//  Position.h
//  MyMap
//
//  Created by wyb on 23-5-12.
//  Copyright (c) 2023年 wyb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface Position : NSObject <MKAnnotation>

//实现MKAnnotation协议必须要定义这个属性
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
//标题
@property (nonatomic,copy) NSString *title;

//初始化方法
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t;

@end
