//
//  StateCollectionViewCell.h
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class State;

@interface StateCollectionViewCell : UICollectionViewCell

@property (nonatomic) State *state;

- (void) updateViews;

@end
