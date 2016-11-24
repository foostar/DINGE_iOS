//
//  ModelTest.m
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import "ModelTest.h"

@implementation ModelTest

+ (NSDictionary *)modelTestWithJsonFileName:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return dic;
    //MovieModel *movie = [MovieModel modelWithDictionary:dic[@"data"][0]];
    //NSLog(@"%@",[movie modelToJSONString]);
}

@end
