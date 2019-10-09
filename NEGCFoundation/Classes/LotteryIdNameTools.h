//
//  LotteryIdNameTools.h
//  Lottery
//
//  Created by tony on 2018/12/14.
//  Copyright © 2018年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryIdNameTools : NSObject
/**
 获取所有彩种的配置信息
 @[@{title:xxx,lotteryId:xxx},...]
 @return 配置信息
 */
+ (NSArray<NSDictionary *> *)allLotteryDataSource;

/**
 获取所有彩种的名称数组
 @[重庆时时彩,...]
 @return 彩种清楚
 */
+ (NSArray<NSString *> *)allLotteryNames;

/**
 通过彩种名称获取彩种id
 
 @param lotteryName 彩种名称，必须是使用当前方法获取到的彩种名称，不支持自定义
 @return 彩种id
 */
+ (NSString *)getLotteryIdByLotteryName:(NSString *)lotteryName;
+ (NSInteger)getLotteryIntIdByLotteryName:(NSString *)lotteryName;
/**
 通过彩种id获取彩种名称
 
 @param lotteryId 彩种id
 @return 查找到的彩种名称
 */
+ (NSString *)getLotteryNameByLotteryId:(NSString *)lotteryId;
/**
 通过彩种id获取彩种名称
 
 @param lotId 彩种id
 @return 查找到的彩种名称
 */
+ (NSString *)getLotteryNameByIntLotteryId:(NSInteger )lotId;
/**
 通过彩种id获取彩种信息
  @{title:xxx,lotteryId:xxx}
 @param lotteryId 彩种id
 @return 彩种信息
 */
+ (NSDictionary *)getLotteryInfoByLotteryId:(NSString *)lotteryId;
+ (NSDictionary *)getLotteryInfoByIntLotteryId:(NSInteger )lotteryId;
+ (NSDictionary *)allLotteryDict;

/**
 获取玩法名称

 @param lotteryId 彩种id
 @param playMethodId 玩法id
 @return 玩法名称
 */
+ (NSString *)playMethodNameWithLotteryId:(LotteryType)lotteryId playMethodId:(NSInteger)playMethodId;
@end
