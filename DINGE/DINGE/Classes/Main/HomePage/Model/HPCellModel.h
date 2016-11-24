//
//  HPCellModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieModel;
@class UserModel;
@interface HPCellModel : NSObject

// 评论id
@property (copy, nonatomic) NSString *_id;
// 评论最后更新时间
@property (copy, nonatomic) NSString *updatedAt;
// 评论创建时间
@property (copy, nonatomic) NSString *createdAt;
// 评论标题
@property (copy, nonatomic) NSString *title;
// 评论内容
@property (copy, nonatomic) NSString *content;
// 评论对应电影的海报
@property (strong, nonatomic) MovieModel *movie;
// 发表该评论的用户
@property (strong, nonatomic) UserModel *commentFrom;
// 评分
@property (strong, nonatomic) NSNumber *rank;

@property (strong, nonatomic) NSNumber *__v;
// 权重
@property (strong, nonatomic) NSNumber *weight;
// 收藏
@property (strong, nonatomic) NSArray *collet;
// 喜欢
@property (strong, nonatomic) NSArray *star;
// 阅读
@property (strong, nonatomic) NSNumber *reading;

@end
