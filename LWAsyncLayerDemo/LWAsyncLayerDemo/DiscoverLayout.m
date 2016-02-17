//
//  DiscoverLayout.m
//  LWAsyncLayerDemo
//
//  Created by 刘微 on 16/1/31.
//  Copyright © 2016年 Warm+. All rights reserved.
//

#import "DiscoverLayout.h"

@interface DiscoverLayout ()


@end

@implementation DiscoverLayout

- (id)initWithStatusModel:(DiscoverStatuModel *)statuModel {
    self = [super init];
    if (self) {
        self.statusModel = statuModel;
        [self layout];
    }
    return self;
}

- (void)layout {
    //avatar
    self.avatarPosition = CGRectMake(10.0f, 20.0f,40.0f, 40.0f);
    //name
    self.nameTextLayout = [[LWTextLayout alloc] initWithText:self.statusModel.user.name
                                                        font:[UIFont systemFontOfSize:14.0f]
                                               textAlignment:NSTextAlignmentCenter
                                                   linespace:0.0f
                                                   textColor:RGB(113, 129, 161, 1)
                                                        rect:CGRectMake(60.0f,
                                                                        20.0f,
                                                                        SCREEN_WIDTH,
                                                                        20.0f)];
    //text
    self.textTextLayout = [[LWTextLayout alloc] initWithText:self.statusModel.text
                                                        font:[UIFont systemFontOfSize:15.0f]
                                               textAlignment:NSTextAlignmentLeft
                                                   linespace:2.0f
                                                   textColor:RGB(40, 40, 40, 1)
                                                        rect:CGRectMake(60.0f,
                                                                        50.0f,
                                                                        SCREEN_WIDTH - 80.0f,
                                                                        CGFLOAT_MAX)];
    //pics
    NSInteger imageCount = [self.statusModel.imageModels count];
    switch (imageCount) {
        case 0:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 0.0f);
            break;
        case 1:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 80.0f);
            break;
        case 2:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 80.0f);
            break;
        case 3:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 80.0f);
            break;
        case 4:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 165.0f);
            break;
        case 5:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 165.0f);
            break;
        case 6:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 165.0f);
            break;
        case 7:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 250.0f);
            break;
        case 8:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 250.0f);
            break;
        case 9:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 250.0f);
            break;
        default:self.imagesPosition = CGRectMake(60.0f, 60.0f + self.textTextLayout.boundsSize.height, 250.0f, 0.0f);
            break;
    }
    //image detail Position

    NSMutableArray* tmpArray = [[NSMutableArray alloc] initWithCapacity:imageCount];
    NSInteger row = 0;
    NSInteger column = 0;
    for (NSInteger i = 0; i < self.statusModel.imageModels.count; i ++) {
        CGRect imageRect = CGRectMake(self.imagesPosition.origin.x + (column * 85.0f),
                                      self.imagesPosition.origin.y + (row * 85.0f),
                                      80.0f,
                                      80.0f);
        NSString* rectString = NSStringFromCGRect(imageRect);
        [tmpArray addObject:rectString];
        column = column + 1;
        if (column > 2) {
            column = 0;
            row = row + 1;
        }
    }
    self.imagePostionArray = tmpArray;
    //timeStamp
    self.timeStampTextLayout = [[LWTextLayout alloc] initWithText:self.statusModel.timeStamp
                                                             font:[UIFont systemFontOfSize:13.0f]
                                                    textAlignment:NSTextAlignmentCenter
                                                        linespace:2.0f
                                                        textColor:[UIColor grayColor]
                                                             rect:CGRectMake(60.0f,
                                                                             70.0f + self.imagesPosition.size.height + self.textTextLayout.boundsSize.height,
                                                                             SCREEN_WIDTH - 80.0f,
                                                                             20.0f)];
    //menu
    self.menuPosition = CGRectMake(SCREEN_WIDTH - 40.0f, 70.0f + self.textTextLayout.boundsSize.height + self.imagesPosition.size.height, 20.0f, 15.0f);
    //cellHeight
    self.cellHeight = 100.0f + self.imagesPosition.size.height + self.textTextLayout.boundsSize.height;
}


@end