//
//  CSGViewController.h
//  CoreMapHW
//
//  Created by Christina Green on 11/18/13.
//  Copyright (c) 2013 Greenster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSGAnnotation.h"

@interface CSGViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

- (IBAction)getCurrentLocation:(id)sender;

@end

