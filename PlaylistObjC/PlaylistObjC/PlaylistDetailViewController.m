//
//  PlaylistDetailViewController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import "PlaylistDetailViewController.h"
#import "PlaylistController.h"

@interface PlaylistDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PlaylistDetailViewController

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
    return [self.playlist.songs count];
}

- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    Song *song = self.playlist.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    return cell;
}

- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Song *song = self.playlist.songs[indexPath.row];
        [[PlaylistController sharedInstance] deleteSong:song fromPlaylist:self.playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (IBAction)addButtonTapped:(id)sender {
    [[PlaylistController sharedInstance] addSongWithTitle:self.titleTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
}

@end
