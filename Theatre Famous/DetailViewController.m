//
//  DetailViewController.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UITextView *synopsisView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieReviewLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewWidth;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textViewWidth.constant = self.view.frame.size.width;
    [self.posterImage sd_setImageWithURL:self.movieDetail.moviePosterURL placeholderImage:[UIImage imageNamed:@"moviePlaceHolder"]];
    self.synopsisView.text = self.movieDetail.movieSynopsis;
    self.movieTitleLabel.text = self.movieDetail.movieTitle;
}

@end
