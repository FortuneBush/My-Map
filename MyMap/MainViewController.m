//
//  MainViewController.m
//  MyMap
//
//  Created by swinglife on 13-11-17.
//  Copyright (c) 2013年 swinglife. All rights reserved.
//

#import "MainViewController.h"
#import "MyPoint.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    //设置MapView的委托为自己
    [self.mapView setDelegate:self];
    
    //标注自身位置
    [self.mapView setShowsUserLocation:YES];
    
    [self.longitudeText setDelegate:self];
    [self.latitudeText setDelegate:self];
    
    [super viewDidLoad];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//MapView委托方法，当定位自身时调用
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",loc.longitude];
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",loc.latitude];
    
    //放大地图到自身的经纬度位置。
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.mapView setRegion:region animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//放置标注
- (IBAction)annotationAction:(id)sender {
    //创建CLLocation 设置经纬度
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:[[self.latitudeText text] floatValue] longitude:[[self.longitudeText text] floatValue]];
    CLLocationCoordinate2D coord = [loc coordinate];
    //创建标题
    NSString *titile = [NSString stringWithFormat:@"%f,%f",coord.latitude,coord.longitude];
    MyPoint *myPoint = [[MyPoint alloc] initWithCoordinate:coord andTitle:titile];
    //添加标注
    [self.mapView addAnnotation:myPoint];
    
    //放大到标注的位置
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [self.mapView setRegion:region animated:YES];
}
@end
