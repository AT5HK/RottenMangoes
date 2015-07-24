//
//  Theatre.h
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theatre : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;
@property (nonatomic) double lat;
@property (nonatomic) double lng;
- (instancetype)initWithName:(NSString*)theatreName theatreAddress:(NSString*)address lat:(double)lat lng:(double)lng;

@end
