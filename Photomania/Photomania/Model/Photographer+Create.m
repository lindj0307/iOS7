//
//  Photographer+Create.m
//  Photomania
//
//  Created by 林东杰 on 11/3/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context  {
    Photographer *photographer = nil;
    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
        
        NSError *error;
        NSArray *matchs = [context executeFetchRequest:request error:&error];
        
        if (!matchs || error || [matchs count] > 1 ) {
            //handle error
        } else if ([matchs count]) {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"photographer"
                                                  inManagedObjectContext:context];
            photographer.name =  name;
        } else {
            photographer = [matchs lastObject];
        }
    }
    
    return photographer;
    //ß视频33:00
}

@end
