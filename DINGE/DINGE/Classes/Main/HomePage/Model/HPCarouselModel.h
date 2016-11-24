//
//  HPCarouselModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/20.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPCarouselModel : NSObject
// 轮播图唯一id
@property (copy, nonatomic) NSString *_id;
// 最后更新时间
@property (copy, nonatomic) NSString *updatedAt;
// 数据创建时间
@property (copy, nonatomic) NSString *createdAt;
// 图片url
@property (copy, nonatomic) NSString *url;
// 图片名称
@property (copy, nonatomic) NSString *name;

@property (strong, nonatomic) NSNumber *__v;

@property (strong, nonatomic) NSNumber *weight;

@end
