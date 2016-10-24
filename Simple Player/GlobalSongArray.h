//
//  GlobalSongArray.h
//  Simple Player
//
//  Created by Justin Oh on 2016-09-25.
//  Copyright © 2016 Justin Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

//DataClass.h
@interface GlobalSongArray : NSObject {
    
    NSMutableArray *array;
}

//@property(nonatomic)NSMutableArray *array;
@property(nonatomic,retain)NSMutableArray *array;
+(GlobalSongArray*)getInstance;
@end


