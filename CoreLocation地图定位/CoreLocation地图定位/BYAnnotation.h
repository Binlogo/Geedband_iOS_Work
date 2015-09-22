//
//  BYAnnotation.h
//  CoreLocation地图定位
//
//  Created by binglogo on 15/9/22.
//  Copyright © 2015年 Binboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BYAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy,) NSString *title;
@property (nonatomic, copy,) NSString *subtitle;

@end
