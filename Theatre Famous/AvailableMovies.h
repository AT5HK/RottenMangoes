//
//  AvailableMovies.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AvailableMovies : NSObject <NSURLSessionDelegate>
-(NSDictionary*)movieGrab:(void (^)(NSArray*movies))success;
@end
