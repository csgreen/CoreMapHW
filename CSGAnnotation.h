//
//  CSGAnnotation.h
//  CoreMapHW
//
//  Created by Christina Green on 11/18/13.
//  Copyright (c) 2013 Greenster. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CSGAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign)   CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)     NSString              *title;
@property (nonatomic, copy)     NSString              *subtitle;

@end
