//
//  ListViewController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "PlaylistController.h"
#import "PlaylistDetailViewController.h"

@interface ListViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

#pragma mark - Actions

- (IBAction)addButtonTapped:(id)sender
{
	[[PlaylistController sharedInstance] createPlaylistWithTitle:self.nameTextField.text];
	[self.tableView reloadData];
}

#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PlaylistController sharedInstance].playlists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        [[PlaylistController sharedInstance] deletePlaylist:playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Playlist* playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        PlaylistDetailViewController *vc = (PlaylistDetailViewController *)segue.destinationViewController;
        vc.playlist = playlist;
    }
}

@end
