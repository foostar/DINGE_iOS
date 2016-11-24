//
//  UserModel.h
//  DINGE
//
//  Created by chocklee on 2016/11/21.
//  Copyright © 2016年 chocklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

// 用户id
@property (copy, nonatomic) NSString *_id;
// 昵称
@property (copy, nonatomic) NSString *nickname;
// 签名
@property (copy, nonatomic) NSString *sign;
// 头像
@property (copy, nonatomic) NSString *avatar;
// 生日
@property (copy, nonatomic) NSString *birthday;
// 城市
@property (copy, nonatomic) NSString *city;
// 性别
@property (copy, nonatomic) NSString *sex;

@end
