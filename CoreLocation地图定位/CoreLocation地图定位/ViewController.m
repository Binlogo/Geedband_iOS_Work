//
//  ViewController.m
//  CoreLocation地图定位
//
//  Created by binglogo on 15/9/11.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "BYAnnotation.h"

@interface ViewController ()<CLLocationManagerDelegate,MKMapViewDelegate> {
    
}

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) NSString *currentLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [_mapView setMapType:MKMapTypeStandard];
    [_mapView setShowsUserLocation:NO];
    [self.view addSubview:_mapView];
    
    _mapView.delegate = self;
    
    // 检测定位功能是否开启
    if ([CLLocationManager locationServicesEnabled]) {
        
        if (!_locationManager) {
            _locationManager = [[CLLocationManager alloc] init];
            if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [_locationManager requestWhenInUseAuthorization];
                [_locationManager requestAlwaysAuthorization];
            }
            
            // 设置代理
            _locationManager.delegate = self;
            // 设置定位精度
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            // 设置距离筛选
            _locationManager.distanceFilter = 100;
            // 开始定位
            [_locationManager startUpdatingLocation];
        }
        
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"定位功能未开启" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
}
// 用户授权状态发生改变调用
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusDenied:
            NSLog(@"授权被拒绝");
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager startUpdatingLocation];
        default:
            break;
    }
}
// 定位成功调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"定位成功");
    [self.locationManager stopUpdatingLocation];
    
    CLLocation *location = locations.lastObject;
    MKCoordinateRegion coordinate = MKCoordinateRegionMake(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), MKCoordinateSpanMake(0.1, 0.1));
    [_mapView setRegion:[_mapView regionThatFits:coordinate] animated:YES];
    
    [self reversLocation:location];
    
    BYAnnotation *annotation = [[BYAnnotation alloc] init];
    annotation.coordinate = location.coordinate;
    
    [self.mapView addAnnotation:annotation];
}

- (void)reversLocation:(CLLocation *)location {
    self.geocoder = [[CLGeocoder alloc] init];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            NSLog(@"解析失败");
        } else if (placemarks.count > 1){
            self.currentLocation = [placemarks firstObject].addressDictionary[@"state"];
            NSLog(@"%@",self.currentLocation);
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败");
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if (![[annotation class] isSubclassOfClass:[BYAnnotation class]]) {
        return nil;
    }
    
    MKPinAnnotationView *pinAnnotation = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    if (!pinAnnotation) {
        pinAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        pinAnnotation.animatesDrop = YES;
        pinAnnotation.pinColor = MKPinAnnotationColorGreen;
        pinAnnotation.canShowCallout = YES;
        
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        leftLabel.text = self.currentLocation;
        leftLabel.backgroundColor = [UIColor redColor];
        pinAnnotation.leftCalloutAccessoryView = leftLabel;
    }
    
    return pinAnnotation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
