//
//  StateCollectionViewController.m
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import "StateCollectionViewController.h"
#import "StateCollectionViewCell.h"
#import "StateController.h"
#import "State.h"

@implementation StateCollectionViewController

static NSString * const reuseIdentifier = @"stateCell";


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[StateController sharedInstance].states count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    StateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    State *state = [StateController sharedInstance].states[indexPath.row];
    
    cell.state = state;
    
    return cell;
}

@end
