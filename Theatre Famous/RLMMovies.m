//
//  RLMMovies.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/24/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "RLMMovies.h"
#import "Movie.h"

@interface RLMMovies ()

@property RLMRealm *standardRealm;

@end

@implementation RLMMovies

- (instancetype)init
{
    self = [super init];
    if (self) {
        _standardRealm = [RLMRealm defaultRealm];
    }
    return self;
}

-(void)realmPersistMovies:(NSArray*)movieObjArray {
    //add to realm -------
    for (Movie *movie in movieObjArray) {
        RLMMovies *rlmMovie = [[RLMMovies alloc]init];
        rlmMovie.movieTitle = movie.movieTitle;
        rlmMovie.movieSynopsis = movie.movieSynopsis;
        rlmMovie.moviePosterURL = movie.moviePosterURL;
        
        [self.realm beginWriteTransaction];
        [self.realm addObject:rlmMovie];
        [self.realm commitWriteTransaction];
    }
}

@end
