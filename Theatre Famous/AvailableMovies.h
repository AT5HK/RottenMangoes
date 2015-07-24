//
//  AvailableMovies.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

@class Movie;
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <Realm/Realm.h>

@interface AvailableMovies : NSObject <NSURLSessionDelegate>

-(void)createMovieObjArray:(void (^)(NSArray*movies))moviesComplete;
-(void)nearestTheatresForMovie:(Movie*)movie currentLocationPlaceMark:(CLPlacemark*)placeMark finishBlock:(void (^)(NSArray*parsedLocations))lookUpComplete;
-(void)grabReviews:(void(^)(NSArray*arrayOfReviews))lookupComplete;

@end
