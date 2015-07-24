//
//  Mapping.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Mapping : NSObject 

-(NSArray*)mapAnnotations:(NSArray*)parsedArray;
-(NSArray*)createTheatreObjArray:(NSArray*)parsedArray;

@end
