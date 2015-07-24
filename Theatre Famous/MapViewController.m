//
//  MapViewController.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "MapViewController.h"
#import "AvailableMovies.h"
#import <CoreLocation/CoreLocation.h>
#import "Mapping.h"
#import "Theatre.h"

@interface MapViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) AvailableMovies *availableMovies;
@property (nonatomic) Mapping *mapping;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) CLPlacemark *placemark;
@property (nonatomic) BOOL alreadyLoaded;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.alreadyLoaded = NO;
    self.availableMovies = [[AvailableMovies alloc]init];
    self.mapping = [[Mapping alloc]init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.distanceFilter = 500;
    [self.locationManager startUpdatingLocation];
}

#pragma mark - helper Methods

- (void)startStandardUpdates:(void(^)(void))retrievedCurrentLocation
{
    
    // Create the location manager if this object does not
    // already have one.
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        [self.locationManager requestWhenInUseAuthorization];
        // Set a movement threshold for new events.
        self.locationManager.distanceFilter = 500; // meters
    }
    ;
    retrievedCurrentLocation();
}

#pragma mark - delegate methods

- (void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"User still thinking..");
        } break;
        case kCLAuthorizationStatusDenied: {
            NSLog(@"User hates you");
        } break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways: {
            [_locationManager startUpdatingLocation]; //Will update location immediately
        } break;
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations objectAtIndex:0];
    [self.locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!error) {
             self.placemark = [placemarks objectAtIndex:0];
             if (!self.alreadyLoaded) {
                 [self startStandardUpdates:^{
                     [self.availableMovies nearestTheatresForMovie:self.movie currentLocationPlaceMark:self.placemark finishBlock:^(NSArray *parsedLocations) {
                         if (parsedLocations) {
                             NSArray *theatreObjs = [self.mapping createTheatreObjArray:parsedLocations];
                             dispatch_async(dispatch_get_main_queue(), ^{
                                             [self.mapView showAnnotations:[self.mapping mapAnnotations:theatreObjs] animated:YES];
                             });
                         }
                         else {
                             NSLog(@"parsedLocations failed: %@", parsedLocations);
                         }
                     }];
                 }];
             }
//             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             NSLog(@"placemark: %@",self.placemark.postalCode);
         }
         else {
             NSLog(@"Geocode failed with error %@", error);
         }
     }];
}


@end
