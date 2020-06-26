//
//  TrailerViewController.m
//  Flix
//
//  Created by Jacob Franz on 6/26/20.
//  Copyright © 2020 Jacob Franz. All rights reserved.
//

#import "TrailerViewController.h"
#import "WebKit/WebKit.h"

@interface TrailerViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) NSArray *results;

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US", self.movie[@"id"]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               self.results = dataDictionary[@"results"];
               
               NSString *trailerURLString = [NSString stringWithFormat:@"https://www.youtube.com/watch?v=%@", self.results[0][@"key"]];
               NSURL *trailerURL = [NSURL URLWithString:trailerURLString];
               NSURLRequest *trailerRequest = [NSURLRequest requestWithURL:trailerURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0];
               
               [self.webView loadRequest:trailerRequest];           }
       }];

    [task resume];
}

- (IBAction)buttonPress:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
