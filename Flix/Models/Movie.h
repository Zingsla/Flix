//
//  Movie.h
//  Flix
//
//  Created by Jacob Franz on 7/1/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *synopsis;
@property (strong, nonatomic) NSURL *posterURL;
@property (strong, nonatomic) NSURL *backdropURL;
@property (strong, nonatomic) NSURL *trailerURL;
@property (strong, nonatomic) NSObject *ID;

- (id)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)moviesWithDictionaries:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
