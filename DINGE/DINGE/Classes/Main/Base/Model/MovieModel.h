//
//  MovieModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ImageModel;
@class RatingModel;
@interface MovieModel : NSObject

// 电影id
@property (copy, nonatomic) NSString *_id;
// 电影名
@property (copy, nonatomic) NSString *title;
// 电影英文名
@property (copy, nonatomic) NSString *etitle;
// 电影上映时间
@property (copy, nonatomic) NSString *releasetime;
// 片长（分钟）
@property (strong, nonatomic) NSNumber *actime;
// 电影图片
@property (strong, nonatomic) ImageModel *images;
// 语言
@property (strong, nonatomic) NSArray *language;
// 电影别名
@property (strong, nonatomic) NSArray *aka;
// 电影类型
@property (strong, nonatomic) NSArray *genres;
// 国家
@property (strong, nonatomic) NSArray *country;
// 演员阵容
@property (strong, nonatomic) NSArray *casts;
// 导演
@property (strong, nonatomic) NSArray *directors;
// 评分
@property (strong, nonatomic) RatingModel *rating;

@end
