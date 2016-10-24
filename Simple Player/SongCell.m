//
//  SongCell.m
//  Simple Player
//
//  Created by Justin Oh on 2016-09-17.
//  Copyright © 2016 Justin Oh. All rights reserved.
//

#import "SongCell.h"

@implementation SongCell{
    UILabel *_titleValue;
    UILabel *_artistValue;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect titleLabelRectangle = CGRectMake(0, 5, 70, 15);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLabelRectangle];
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.text = @"Title:";
        titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:titleLabel];
        
        CGRect artistLabelRectangle = CGRectMake(0, 26, 70, 15);
        UILabel *artistLabel = [[UILabel alloc] initWithFrame:artistLabelRectangle];
        artistLabel.textAlignment = NSTextAlignmentRight;
        artistLabel.text = @"Artist:";
        artistLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:artistLabel];
        
        CGRect titleValueRectangle = CGRectMake(80, 5, 200, 15);
        _titleValue = [[UILabel alloc] initWithFrame:titleValueRectangle];
        [self.contentView addSubview:_titleValue];
        
        CGRect artistValueRectangle = CGRectMake(80, 25, 200, 15);
        _artistValue = [[UILabel alloc] initWithFrame:artistValueRectangle];
        [self.contentView addSubview:_artistValue];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)t {
    if (![t isEqualToString:_title]) {
        _title = [t copy];
        _titleValue.text = _title;
    }
}

- (void)setArtist:(NSString *)a {
    if (![a isEqualToString:_artist]) {
        _artist = [a copy];
        _artistValue.text = _artist;
    }
}

@end
