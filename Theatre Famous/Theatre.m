//
//  Theatre.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/23/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (instancetype)initWithName:(NSString*)theatreName theatreAddress:(NSString*)address lat:(double)lat lng:(double)lng
{
    self = [super init];
    if (self) {
        self.name = theatreName;
        self.address = address;
        self.lat = lat;
        self.lng = lng;
    }
    return self;
}

@end
