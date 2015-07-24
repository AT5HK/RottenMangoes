//
//  MapViewController.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Movie.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic) Movie *movie;

@end
