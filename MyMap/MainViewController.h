//
//  MainViewController.h
//  MyMap
//
//  Created by swinglife on 13-11-17.
//  Copyright (c) 2013年 swinglife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController : UIViewController<MKMapViewDelegate,UITextFieldDelegate>

//经度
@property (weak, nonatomic) IBOutlet UITextField *longitudeText;
//纬度
@property (weak, nonatomic) IBOutlet UITextField *latitudeText;
//地图
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//自己经度
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
//自己纬度
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;

//放置标注Button
- (IBAction)annotationAction:(id)sender;

@end
