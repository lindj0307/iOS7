//
//  JustPostedFlikrPhotosTVC.m
//  Shutterbug
//
//  Created by 林东杰 on 10/28/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "JustPostedFlikrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface JustPostedFlikrPhotosTVC ()

@end

@implementation JustPostedFlikrPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchPhotos];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchPhotos {
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Block Main thread 
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResults = [NSJSONSerialization
                                         JSONObjectWithData:jsonResults options:0 error:nil];
    NSArray *photos =  [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    
    NSLog(@"Flickr result = %@",propertyListResults);
    self.photos = photos;
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
