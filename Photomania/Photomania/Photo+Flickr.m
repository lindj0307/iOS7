//
//  Photo+Flickr.m
//  Photomania
//
//  Created by 林东杰 on 10/30/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context {
    Photo *photo = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    NSString *unique = photoDictionary[FLICKR_PHOTO_ID];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@",unique];
    
    NSError *error;
    NSArray *matchs = [context executeFetchRequest:request error:&error];
    if (!matchs || error || [matchs count] > 1 ) {
        //handle error
    } else if ([matchs count]) {
        photo = [matchs firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                              inManagedObjectContext:context];
        photo.unique = unique;
        photo.title = [photoDictionary valueForKeyPath:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.imageURL = [[FlickrFetcher URLforPhoto:photoDictionary
                                              format:FlickrPhotoFormatLarge] absoluteString];
        NSString *photographerName = [photoDictionary valueForKey:FLICKR_PHOTO_OWNER];
        photo.whoTook = [Photographer photographerWithName:photographerName
                                    inManagedObjectContext:context];
    }
    
    return photo;
    
}

+ (void)loadPhotosFromFlickrArray:(NSArray *) photos
         intoManagedObjectContext:(NSManagedObjectContext *)context {
    
}

@end
