//
//  MovieModel.m
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "MovieModel.h"
#import "ImageModel.h"
#import "RatingModel.h"
#import "LanguageModel.h"
#import "AkaModel.h"
#import "GenreModel.h"
#import "CountryModel.h"
#import "CastsModel.h"
#import "DirectorModel.h"

@implementation MovieModel

/**
 *  通过实现 协议中的 modelContainerPropertyGenericClass，返回 Model 属性容器中需要存放的对象类型，YYModel 会自动进行处理。对象类型可以是 Class 或者 Class name
 */
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"language":LanguageModel.class,
             @"aka":AkaModel.class,
             @"genres":GenreModel.class,
             @"country":CountryModel.class,
             @"casts":CastsModel.class,
             @"directors":DirectorModel.class};
}

@end
