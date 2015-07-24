//
//  RLMMovies.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/24/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>


@interface RLMMovies : RLMObject

@property NSURL *moviePosterURL;
@property NSString *movieTitle;
@property NSString *movieSynopsis;

@end
