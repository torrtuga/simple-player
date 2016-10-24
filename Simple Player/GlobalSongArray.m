//
//  GlobalSongArray.m
//  Simple Player
//
//  Created by Justin Oh on 2016-09-25.
//  Copyright © 2016 Justin Oh. All rights reserved.
//

#import "GlobalSongArray.h"

//DataClass.m
@implementation GlobalSongArray
@synthesize array;

static GlobalSongArray *instance = nil;

+(GlobalSongArray *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [GlobalSongArray new];
        }
    }
    return instance;
}
@end