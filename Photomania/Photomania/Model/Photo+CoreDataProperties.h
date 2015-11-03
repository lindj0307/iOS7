//
//  Photo+CoreDataProperties.h
//  Photomania
//
//  Created by 林东杰 on 10/30/15.
//  Copyright © 2015 Anta. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *subtitle;
@property (nullable, nonatomic, retain) NSString *imageURL;
@property (nullable, nonatomic, retain) NSString *unique;
@property (nullable, nonatomic, retain) NSManagedObject *whoTook;

@end

NS_ASSUME_NONNULL_END
