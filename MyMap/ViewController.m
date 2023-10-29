//
//  ViewController.m
//  MyMap
//
//  Created by wyb on 23-5-12.
//  Copyright (c) 2023年 wyb. All rights reserved.
//

#import "ViewController.h"
#import "Position.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor whiteColor]; // 将背景色设置为白色
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.latitudeText.delegate = self;
    self.longitudeText.delegate = self;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    
    if ([CLLocationManager locationServicesEnabled]) {
        [self.locationManager startUpdatingLocation];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)annotationAction:(id)sender {
    CLLocationDegrees latitude = [self.latitudeText.text doubleValue];
    CLLocationDegrees longitude = [self.longitudeText.text doubleValue];
    
    if (latitude < -90 || latitude > 90) {
        [self showAlertWithTitle:@"纬度不合法" message:@"纬度范围为-90~90度"];
        return;
    }
    
    if (longitude < -180 || longitude > 180) {
        [self showAlertWithTitle:@"经度不合法" message:@"经度范围为-180~180度"];
        return;
    }
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    Position *point = [[Position alloc] initWithCoordinate:coordinate title:[NSString stringWithFormat:@"%f,%f",  latitude,longitude]];
    [self.mapView addAnnotation:point];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250);
    [self.mapView setRegion:region animated:YES];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D loc = userLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    // 将经纬度写入名为positionLabel的UILabel
    self.positionLabel.text = [NSString stringWithFormat:@"经度：%.6f   纬度：%.6f", coordinate.latitude, coordinate.longitude];
    
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"获取地理位置信息失败：%@", error);
}

@end


