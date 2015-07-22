//
//  AvailableMovies.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "AvailableMovies.h"
#import "Movie.h"

@interface AvailableMovies ()
@property (nonatomic) NSArray *inTheatreMovies;
@end

@implementation AvailableMovies

- (void)someMethodThatTakesABlock:(void (^)(NSArray*movies))blockName {
    
}

-(NSArray*)movieGrab:(void (^)(NSArray*movies))success {
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=55gey28y6ygcr8fjy4ty87ek&page_limit=1&page=50";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil ];
    
    NSURLSessionTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSData *moviesData = [NSData dataWithContentsOfURL:location];
                NSError *serializationError = nil;
                self.inTheatreMovies = [[NSJSONSerialization JSONObjectWithData:moviesData options:0 error:&serializationError]valueForKey:@"movies"];
                success(self.inTheatreMovies);
                
            }
        }];
    [task resume];
    return self.inTheatreMovies;
}

-(NSArray*)createMovieObjArray {
    NSMutableArray *createdMovieArray;
    [self movieGrab:^(NSArray *movies) {
        for (NSDictionary *movieProperties in movies) {
            
//            self.movie.movieSynopsis = [movieProperties valueForKey:@"synopsis"];
//            self.movie.movieTitle = [movieProperties valueForKey:@"title"];
//            [createdMovieArray addObject:self.movie];
        }
    }];
    return createdMovieArray;
}



@end
