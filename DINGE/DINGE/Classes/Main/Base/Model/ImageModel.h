//
//  ImageModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

// 大图地址
@property (copy, nonatomic) NSString *large;
// 中图地址
@property (copy, nonatomic) NSString *medium;
// 小图地址
@property (copy, nonatomic) NSString *small;

@end
