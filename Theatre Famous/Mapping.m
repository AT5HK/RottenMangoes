//
//  Mapping.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "Mapping.h"
#import "Theatre.h"


@implementation Mapping

-(NSArray*)createTheatreObjArray:(NSArray*)parsedArray {
    NSMutableArray *arrayOfTheatreObj = [NSMutableArray array];
    for (NSDictionary *theatreDictionary in parsedArray) {
        Theatre *theatre = [[Theatre alloc]initWithName:[theatreDictionary valueForKey:@"name"]
                                         theatreAddress:[theatreDictionary valueForKey:@"address"]
                                                    lat:[[theatreDictionary valueForKey:@"lat"] doubleValue]
                                                    lng:[[theatreDictionary valueForKey:@"lng"] doubleValue]];
        [arrayOfTheatreObj addObject:theatre];
    }
    return arrayOfTheatreObj;
}

-(NSArray*)mapAnnotations:(NSArray*)theatreObjArray {
    NSMutableArray *arrayOfAnnotations = [NSMutableArray array];
    for (Theatre *theatre in theatreObjArray) {
        CLLocationCoordinate2D locationOfTheatre;
        locationOfTheatre.latitude =  theatre.lat;
        locationOfTheatre.longitude = theatre.lng;
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
        annotation.title = theatre.name;
        annotation.subtitle = theatre.address;
        annotation.coordinate = locationOfTheatre;
        [arrayOfAnnotations addObject:annotation];
    }
    return arrayOfAnnotations;
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (locationOfTheatre, 2000, 2000);
}

@end
