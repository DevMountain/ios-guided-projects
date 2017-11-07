//
//  StateCollectionViewCell.m
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import "StateCollectionViewCell.h"
#import "State.h"

@interface StateCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation StateCollectionViewCell

- (void)updateViews {
    self.nameLabel.text = self.state.name;
    self.imageView.image = [UIImage imageNamed: self.state.abbreviation];
}

- (void)setState:(State *)state {
    _state = state;
    [self updateViews];
}

@end
