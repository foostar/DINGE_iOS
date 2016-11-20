//
//  HPCarouselModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/20.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPCarouselModel : NSObject

@property (copy, nonatomic) NSString *_id;

@property (copy, nonatomic) NSString *updatedAt;

@property (copy, nonatomic) NSString *createdAt;
// 图片url
@property (copy, nonatomic) NSString *url;

@property (strong, nonatomic) NSNumber *__v;

@property (strong, nonatomic) NSNumber *weight;

@end
