//
//  AppDelegate.m
//  Simple Player
//
//  Created by Justin Oh on 2016-09-11.
//  Copyright © 2016 Justin Oh. All rights reserved.
//

#import "AppDelegate.h"
#import "GlobalSongArray.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    // Override point for customization after application launch.
    
    GlobalSongArray *songs = [GlobalSongArray getInstance];
    songs.array = [[NSMutableArray alloc] init];

    songs.array = [NSMutableArray arrayWithObjects:
                   nil];
        
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *directoryURL =  [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]; // URL pointing to the directory you want to browse (Documents)
    NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator *enumerator = [fileManager
                                         enumeratorAtURL:directoryURL
                                         includingPropertiesForKeys:keys
                                         options:0
                                         errorHandler:^(NSURL *url, NSError *error) {
                                             // Handle the error.
                                             // Return YES if the enumeration should continue after the error.
                                             return YES;
                                         }];
    
    for (NSURL *url in enumerator) {
        NSError *error;
        NSNumber *isDirectory = nil;
        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
            // handle error
        }
        else if (! [isDirectory boolValue]) {
            // No error and it’s not a directory; do something with the file
            
            NSString *extension = [url pathExtension];
            
            if ([extension isEqualToString:@"mp3"] ||
                [extension isEqualToString:@"mp4"] ||
                [extension isEqualToString:@"m4a"] ||
                [extension isEqualToString:@"aac"] ||
                [extension isEqualToString:@"wav"] ||
                [extension isEqualToString:@"alac"]
                ) {
                
                AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
                
                NSArray *keys = [NSArray arrayWithObjects:@"commonMetadata", nil];
                [asset loadValuesAsynchronouslyForKeys:keys completionHandler:^{
                    NSArray *artworks = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata
                                                                       withKey:AVMetadataCommonKeyArtwork
                                                                      keySpace:AVMetadataKeySpaceCommon];
                    
                    for (AVMetadataItem *item in artworks) {
                        if ([item.keySpace isEqualToString:AVMetadataKeySpaceID3]) {
                            NSDictionary *d = [item.value copyWithZone:nil];
                            //self.currentSongArtwork = [UIImage imageWithData:[d objectForKey:@"data"]];
                        } else if ([item.keySpace isEqualToString:AVMetadataKeySpaceiTunes]) {
                            //self.currentSongArtwork = [UIImage imageWithData:[item.value copyWithZone:nil]];
                        }
                    }
                }];
                
                [songs.array addObject:asset];
                
            }
        }
    }
    
    /*AVAsset *asset = songs.array[indexPath.row];
     
     NSArray *titles = [AVMetadataItem metadataItemsFromArray:asset.commonMetadata withKey:AVMetadataCommonKeyTitle keySpace:AVMetadataKeySpaceCommon];
     
     AVMetadataItem *title = [titles objectAtIndex:0];
     
     cell.title = [title.value copyWithZone:nil];
*/
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"commonMetadata" ascending:YES];
    [songs.array sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
