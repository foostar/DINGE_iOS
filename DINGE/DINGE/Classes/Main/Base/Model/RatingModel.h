//
//  RatingModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RatingModel : NSObject

// 电影评分
@property (strong, nonatomic) NSString *average;
// 粉数
@property (strong, nonatomic) NSNumber *star;

@end
