//
//  DetailViewController.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"
#import "AvailableMovies.h"
#import "DetailTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UITextView *synopsisView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewWidth;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) AvailableMovies *availableMovies;
@property (nonatomic) NSArray *reviewsArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textViewWidth.constant = self.view.frame.size.width;
    self.availableMovies = [[AvailableMovies alloc]init];
    [self.availableMovies grabReviews:^(NSArray *arrayOfReviewQuotes) {
        self.reviewsArray = arrayOfReviewQuotes;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    [self.posterImage sd_setImageWithURL:self.movieDetail.moviePosterURL placeholderImage:[UIImage imageNamed:@"moviePlaceHolder"]];
    self.synopsisView.text = self.movieDetail.movieSynopsis;
}

#pragma mark - segue 

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MapViewController"]) {
        [segue.destinationViewController setMovie:self.movieDetail];
    }
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.reviewQuoteLabel.text = self.reviewsArray[indexPath.row];
    return cell;
}



@end
