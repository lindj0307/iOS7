//
//  Photo+Flickr.h
//  Photomania
//
//  Created by 林东杰 on 10/30/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosFromFlickrArray:(NSArray *) photos
         intoManagedObjectContext:(NSManagedObjectContext *)context;

@end
