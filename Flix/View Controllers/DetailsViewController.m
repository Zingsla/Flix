//
//  DetailsViewController.m
//  Flix
//
//  Created by Jacob Franz on 6/24/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.posterView setImageWithURL:self.movie.posterURL];
    
    if (self.movie.backdropURL != nil) {
        [self.backdropView setImageWithURL:self.movie.backdropURL];
    }
    else {
        self.backdropView.image = nil;
    }
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;
    
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TrailerViewController *trailerViewController = segue.destinationViewController;
    trailerViewController.movie = self.movie;
}

@end
