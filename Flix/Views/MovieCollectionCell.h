//
//  MovieCollectionCell.h
//  Flix
//
//  Created by Jacob Franz on 6/25/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (strong, nonatomic) Movie *movie;

@end

NS_ASSUME_NONNULL_END
