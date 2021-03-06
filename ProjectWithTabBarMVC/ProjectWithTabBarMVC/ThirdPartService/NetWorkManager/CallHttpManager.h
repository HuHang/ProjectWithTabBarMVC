//
//  CallHttpManager.h
//  CarGPS
//
//  Created by Charlot on 2017/3/24.
//  Copyright © 2017年 Charlot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CallHttpManager : NSObject

//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(id data);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError *error);

+ (void)netWorkReachAbilityManager;
//get请求
+(void)getWithUrlString:(NSString *)urlString success:(HttpSuccess)success failure:(HttpFailure)failure;


//post请求
+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
@end
