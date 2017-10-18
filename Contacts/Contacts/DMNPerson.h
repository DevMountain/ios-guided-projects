//
//  DMNPerson.h
//  Contacts
//
//  Created by Andrew R Madsen on 8/17/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNPerson : NSObject

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phoneNumber;

@end
