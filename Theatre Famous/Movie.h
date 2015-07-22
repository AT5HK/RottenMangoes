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

@property (nonatomic) UIImage *moviePoster;
@property (nonatomic) NSString *movieTitle;
@property (nonatomic) NSString *movieSynopsis;
- (instancetype)initWithTitle:(NSString*)title movieSynopsis:(NSString*)synopsis poster:(UIImage*)poster;

@end
