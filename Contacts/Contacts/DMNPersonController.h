//
//  DMNPersonController.h
//  Contacts
//
//  Created by Andrew R Madsen on 8/17/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNPerson;

@interface DMNPersonController : NSObject

+ (instancetype)sharedController;

- (void)addPerson:(DMNPerson *)person;
- (void)deletePerson:(DMNPerson *)person;

@property (nonatomic, retain, readonly) NSArray *people;

@end
