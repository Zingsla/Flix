//
//  MovieCell.m
//  Flix
//
//  Created by Jacob Franz on 6/24/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    
    self.titleLabel.text = self.movie.title;
    self.synopsisLabel.text = self.movie.synopsis;
    
    self.posterView.image = nil;
    if (self.movie.posterURL != nil) {
        [self.posterView setImageWithURL:self.movie.posterURL];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
