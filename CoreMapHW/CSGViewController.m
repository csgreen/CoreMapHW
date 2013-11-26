//
//  CSGViewController.m
//  CoreMapHW
//
//  Created by Christina Green on 11/18/13.
//  Copyright (c) 2013 Greenster. All rights reserved.
//

#import "CSGViewController.h"

@interface CSGViewController ()

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation CSGViewController{
    CLLocationManager *locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = 10;
    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self addAnnotation];
}

-(void)addAnnotation
{
    CSGAnnotation *spaceNeedleAnnotation = [[CSGAnnotation alloc] init];
    spaceNeedleAnnotation.coordinate = CLLocationCoordinate2DMake(47.620506, -122.349277);
    spaceNeedleAnnotation.title = @"Space Needle";
    spaceNeedleAnnotation.subtitle = @"Best Place on Earth";
    
    [_mapView addAnnotation:spaceNeedleAnnotation];
    

    CSGAnnotation *greenLakeAnnotation = [[CSGAnnotation alloc] init];
    greenLakeAnnotation.coordinate = CLLocationCoordinate2DMake(47.6779, -122.3369);
    greenLakeAnnotation.title = @"Green Lake";
    greenLakeAnnotation.subtitle = @"Great for a walk";
    
    [_mapView addAnnotation:greenLakeAnnotation];
    
    MKCoordinateRegion myRegion = MKCoordinateRegionMakeWithDistance(spaceNeedleAnnotation.coordinate, 8000, 8000);
    
    [_mapView setRegion:myRegion animated:YES];
    
}
//-(CLLocationCoordinate2D) getLocation
//{
//  
//  
//    [locationManager startUpdatingLocation];
//    CLLocation *location = [locationManager location];
//    CLLocationCoordinate2D coordinate = [location coordinate];
//    
//    return coordinate;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCurrentLocation:(id)sender
{
    [locationManager stopUpdatingLocation];
    [locationManager startUpdatingLocation];
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error.debugDescription);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
  //  CLLocation *currentLocation = newLocation;
    
//    if (currentLocation != nil) {
//        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
//    }
    
//    [_mapView setCenterCoordinate:newLocation.coordinate animated:NO];
    [_mapView setRegion:MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100) animated:YES];
}
@end
