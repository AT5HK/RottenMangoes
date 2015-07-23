//
//  AvailableMovies.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//


#import "AvailableMovies.h"
#import "Movie.h"
#import "MovieCollectionViewController.h"


static NSString * const imgIdentifier = @"dkpu1ddg7pbsk.cloudfront.net";

@interface AvailableMovies ()
@property (nonatomic) NSArray *inTheatreMovies;
@end

@implementation AvailableMovies



-(void)movieGrab:(void (^)(NSArray*movies))success {
    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=55gey28y6ygcr8fjy4ty87ek";
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
}

-(void)createMovieObjArray:(void (^)(NSArray*movies))moviesComplete {
    NSMutableArray *createdMovieArray = [NSMutableArray array];
    [self movieGrab:^(NSArray *movies) {
        for (NSDictionary *movieProperties in movies) {
            NSString *fullURL = [movieProperties valueForKeyPath:@"posters.original"];
            NSRange range = NSMakeRange([fullURL rangeOfString:imgIdentifier].location, fullURL.length-1);
            NSString *suffixURL = [fullURL substringFromIndex:range.location];
            NSURL *posterURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", suffixURL]];
            
            Movie *movie = [[Movie alloc]initWithTitle:[movieProperties valueForKey:@"title"]
                                         movieSynopsis:[movieProperties valueForKey:@"synopsis"]
                                        URLForPoster:posterURL];
            [createdMovieArray addObject:movie];
        }
        moviesComplete(createdMovieArray);
    }];
}



@end
