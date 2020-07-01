//
//  DetailsViewController.h
//  Flix
//
//  Created by Jacob Franz on 6/24/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Movie *movie;

@end

NS_ASSUME_NONNULL_END
