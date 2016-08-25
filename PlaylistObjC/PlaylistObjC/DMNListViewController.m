//
//  ListViewController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "DMNListViewController.h"
#import "DMNPlaylistController.h"
#import "DMNPlaylistDetailViewController.h"

@interface DMNListViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation DMNListViewController

#pragma mark - Actions

- (IBAction)addButtonTapped:(id)sender
{
	[[DMNPlaylistController sharedInstance] createPlaylistWithTitle:self.nameTextField.text];
	[self.tableView reloadData];
}

#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[DMNPlaylistController sharedInstance].playlists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    DMNPlaylist *playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DMNPlaylist *playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
        [[DMNPlaylistController sharedInstance] deletePlaylist:playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DMNPlaylist* playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
        DMNPlaylistDetailViewController *vc = (DMNPlaylistDetailViewController *)segue.destinationViewController;
        vc.playlist = playlist;
    }
}

@end
