//
//  State.h
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface State : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *abbreviation;

- (instancetype)initWithName:(NSString *)name abbreviation:(NSString *)abbreviation;

@end
