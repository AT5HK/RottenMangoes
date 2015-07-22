//
//  ViewController.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "ViewController.h"
#import "AvailableMovies.h"

@interface ViewController ()
@property (nonatomic) AvailableMovies *availableMovies;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.availableMovies = [[AvailableMovies alloc]init];
    
//    [self.availableMovies movieGrab:^(NSArray *movies) {
//        NSLog(@"%@",movies);
//    }];
}

@end
