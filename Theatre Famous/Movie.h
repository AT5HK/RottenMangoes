//
//  Movie.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic) NSURL *moviePosterURL;
@property (nonatomic) NSString *movieTitle;
@property (nonatomic) NSString *movieSynopsis;
@property (nonatomic) UIImage *posterImage;
- (instancetype)initWithTitle:(NSString*)title movieSynopsis:(NSString*)synopsis URLForPoster:(NSURL*)posterURL;

@end
