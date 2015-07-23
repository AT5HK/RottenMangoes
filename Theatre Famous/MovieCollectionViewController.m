//
//  MovieCollectionViewController.m
//  Theatre Famous
//
//  Created by Auston Salvana on 7/22/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "MovieCollectionViewController.h"
#import "MovieCollectionViewCell.h"
#import "AvailableMovies.h"
#import "Movie.h"
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieCollectionViewController ()

@property (nonatomic) AvailableMovies *availableMovies;


@end

@implementation MovieCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.availableMovies = [[AvailableMovies alloc]init];
    [self.availableMovies createMovieObjArray:^(NSArray *movies) {
        self.arrayOfMovies = movies;
    }];
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout*)[self.collectionView collectionViewLayout];
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 1;
    [flow setSectionInset:UIEdgeInsetsMake(0, 2, 0, 2)];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        NSIndexPath *cellIndex = sender;
        Movie *movie = self.arrayOfMovies[cellIndex.row];
        MovieCollectionViewCell *cell = (MovieCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:cellIndex];
        movie.posterImage = cell.cellImage.image;
        [segue.destinationViewController setMovieDetail:movie];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Movie *movie = self.arrayOfMovies[indexPath.row];
    [cell.cellImage sd_setImageWithURL:movie.moviePosterURL
                      placeholderImage:[UIImage imageNamed:@"moviePlaceHolder"]];
    movie.posterImage = cell.cellImage.image;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailViewController" sender:indexPath];
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
