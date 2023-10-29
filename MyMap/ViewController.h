//
//  ViewController.h
//  MyMap
//
//  Created by wyb on 23-5-12.
//  Copyright (c) 2023年 wyb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate,UITextFieldDelegate,CLLocationManagerDelegate>

//经度
@property (weak, nonatomic) IBOutlet UITextField *longitudeText;
//纬度
@property (weak, nonatomic) IBOutlet UITextField *latitudeText;
//地图
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//当前经纬度
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
//获取当前位置
@property (strong, nonatomic) CLLocationManager *locationManager;

//放置标注Button
- (IBAction)annotationAction:(id)sender;

@end
