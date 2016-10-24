//
//  SongsViewController.m
//  Simple Player
//
//  Created by Justin Oh on 2016-09-12.
//  Copyright © 2016 Justin Oh. All rights reserved.
//

#import "SongsViewController.h"
#import "SongCell.h"
#import "GlobalSongArray.h"

@interface SongsViewController ()

@end

@implementation SongsViewController

static NSString *CellIdentifier = @"CellTableIdentifier";
GlobalSongArray *songs;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    songs = [GlobalSongArray getInstance];
    
    
    UITableView *tableView = [self.view viewWithTag:1];
    [tableView registerClass:[SongCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [songs.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSString *SimpleIdentifier = @"SimpleIdentifier";
    
    SongCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[SongCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    //cell.textLabel.text = self.people[indexPath.row];
    AVAsset *asset = songs.array[indexPath.row];
    
    
    NSArray *titles = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata withKey:AVMetadataCommonKeyTitle keySpace:AVMetadataKeySpaceCommon];
    NSArray *artists = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata withKey:AVMetadataCommonKeyArtist keySpace:AVMetadataKeySpaceCommon];
    NSArray *albumNames = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata withKey:AVMetadataCommonKeyAlbumName keySpace:AVMetadataKeySpaceCommon];
    
    AVMetadataItem *title = [titles objectAtIndex:0];
    AVMetadataItem *artist = [artists objectAtIndex:0];
    AVMetadataItem *albumName = [albumNames objectAtIndex:0];
    
    cell.title = [title.value copyWithZone:nil];
    cell.artist = [artist.value copyWithZone:nil];
    
    UIImage *gandp = [UIImage imageNamed:@"gp.png"];
    //cell.imageView.image = gandp;
    
    if(indexPath.row == 0)
        cell.detailTextLabel.text = @"#0";
    if(indexPath.row == 1)
        cell.detailTextLabel.text = @"#1";
    if(indexPath.row == 2)
        cell.detailTextLabel.text = @"#2";
    
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //return nil;
    return indexPath;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *songName = songs.array[indexPath.row];
    NSString *myMessage = [[NSString alloc] initWithFormat:@"Selected: %@", songName];

    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Clicked" message:myMessage delegate:nil cancelButtonTitle:@"Close dis" otherButtonTitles:nil, nil];
    
    
    [myAlert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
