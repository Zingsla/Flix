//
//  Movie.m
//  Flix
//
//  Created by Jacob Franz on 7/1/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    self.title = dictionary[@"title"];
    self.synopsis = dictionary[@"overview"];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterURLString = dictionary[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    self.posterURL = [NSURL URLWithString:fullPosterURLString];
    
    if ([dictionary[@"backdrop_path"] isKindOfClass:[NSString class]]) {
    NSString *backdropURLString = dictionary[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    self.backdropURL = [NSURL URLWithString:fullBackdropURLString];
    }
    
    self.ID = dictionary[@"id"];
    
    return self;
}

+ (NSMutableArray *)moviesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in dictionaries) {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    
    return movies;
}

@end
