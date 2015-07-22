//
//  Movie.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString*)title movieSynopsis:(NSString*)synopsis poster:(UIImage*)moviePoster
{
    self = [super init];
    if (self) {
        self.movieTitle = title;
        self.movieSynopsis = synopsis;
        self.moviePoster = moviePoster;
    }
    return self;
}

@end
