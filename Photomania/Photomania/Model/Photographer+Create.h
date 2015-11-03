//
//  Photographer+Create.h
//  Photomania
//
//  Created by 林东杰 on 11/3/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context;

@end
