//
//  ListViewController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import "ListViewController.h"
#import "PlaylistController.h"
#import "PlaylistDetailViewController.h"

@interface ListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PlaylistController sharedInstance].playlists count];
}

- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    return cell;
}

- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Playlist *playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        [[PlaylistController sharedInstance] deletePlaylist:playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (IBAction)addButtonTapped:(id)sender {
    [[PlaylistController sharedInstance] createPlaylistWithTitle:self.nameTextField.text];
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Playlist* playlist = [PlaylistController sharedInstance].playlists[indexPath.row];
        PlaylistDetailViewController *vc = (PlaylistDetailViewController *)segue.destinationViewController;
        vc.playlist = playlist;
    }
}


@end
