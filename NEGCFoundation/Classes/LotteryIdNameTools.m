//
//  LotteryIdNameTools.m
//  Lottery
//
//  Created by tony on 2018/12/14.
//  Copyright © 2018年 shine. All rights reserved.
//

#import "LotteryIdNameTools.h"
#import "CHCSVParser.h"

@implementation LotteryIdNameTools
#pragma mark - 赛车系列
+ (NSArray *)saicheSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    /******赛车系列******/
    // 北京赛车
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_saiche",@"lotteryId":@(LotteryTypeBJSCA)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_saiche",@"lotteryId":@(LotteryTypeBJSCB)}];
    // 快乐快艇
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_kuaitin",@"lotteryId":@(LotteryTypeKLKTA)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_kuaitin",@"lotteryId":@(LotteryTypeKLKTB)}];
    // 幸运飞艇
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_kuaitin",@"lotteryId":@(LotteryTypeXYFTA)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_kuaitin",@"lotteryId":@(LotteryTypeXYFTB)}];
    // 澳洲F1赛车
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_f1",@"lotteryId":@(LotteryTypeAZF1A)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_f1",@"lotteryId":@(LotteryTypeAZF1B)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_f1",@"lotteryId":@(LotteryTypeJZF1A)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_f1",@"lotteryId":@(LotteryTypeJZF1B)}];
    return arrayM;
}
#pragma mark - 时时彩系列
+ (NSArray *)shishiCaiSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    // 时时彩
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeCQSSCA)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeCQSSCB)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeKLSSCA)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeKLSSCB)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeAZSSC)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeAZSSCB)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeJZSSCA)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_ssc",@"lotteryId":@(LotteryTypeJZSSCB)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_ffc",@"lotteryId":@(LotteryTypeTXSSCA)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_ffc",@"lotteryId":@(LotteryTypeTXSSCB)}];
    return arrayM;
}
#pragma mark - 香港彩系列
+ (NSArray *)hongkongCaiSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    // 香港彩
    [arrayM addObject:@{@"desc":@"每周二、四、六",@"icon":@"common_lottery_lhc",@"lotteryId":@(LotteryTypeLHC)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_hongkong",@"lotteryId":@(LotteryTypeKLWF)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_hongkong",@"lotteryId":@(LotteryTypeAZ165)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_hongkong",@"lotteryId":@(LotteryTypeJZKLF)}];
    return arrayM;
}
#pragma mark - 快三系列
+ (NSArray *)quickThreeSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    // 快三
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeJSKS)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeBJKS)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeFJKS)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeHuBKS)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeKLKS)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeAZKS)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_quick3",@"lotteryId":@(LotteryTypeJZKS)}];
    
    
    return arrayM;
}
#pragma mark - 11选5系列
+ (NSArray *)elevenSelectFiveSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeGDX)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeBJX)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeJXX)}];
    [arrayM addObject:@{@"desc":@"20分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeSDX)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeKLX)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeAZX)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_11select5",@"lotteryId":@(LotteryTypeJZX)}];
    return arrayM;
}
#pragma mark - 快乐8系列
+ (NSArray *)happy8Section
{
    NSMutableArray *arrayM = [NSMutableArray array];
    // 北京快乐8
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_bjkl8",@"lotteryId":@(LotteryTypeBJKL8)}];
    [arrayM addObject:@{@"desc":@"5分钟/期",@"icon":@"common_lottery_keno",@"lotteryId":@(LotteryTypeBJKENO)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_azact",@"lotteryId":@(LotteryTypeAZACT)}];
    [arrayM addObject:@{@"desc":@"2分40秒/期",@"icon":@"common_lottery_keno",@"lotteryId":@(LotteryTypeAZKENO)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_jzkl8",@"lotteryId":@(LotteryTypeJZKL8)}];
    [arrayM addObject:@{@"desc":@"1分钟/期",@"icon":@"common_lottery_keno",@"lotteryId":@(LotteryTypeJZKENO)}];
    return arrayM;
}
#pragma mark - 低频彩系列
+ (NSArray *)openSlowSection
{
    NSMutableArray *arrayM = [NSMutableArray array];
    // 双色球
    [arrayM addObject:@{@"desc":@"每周二、四、日开奖",@"icon":@"common_lottery_ssq",@"lotteryId":@(LotteryTypeSSQ)}];
    // 海南七星彩
    [arrayM addObject:@{@"desc":@"每周二、五、日开奖",@"icon":@"common_lottery_hnqxc",@"lotteryId":@(LotteryTypeHNQXC)}];
    // 排列3/5
    [arrayM addObject:@{@"desc":@"每天开奖",@"icon":@"common_lottery_pl35",@"lotteryId":@(LotteryTypePL35)}];
    // 福彩3D
    [arrayM addObject:@{@"desc":@"每天开奖",@"icon":@"common_lottery_3d",@"lotteryId":@(LotteryTypeFC3D)}];
    return arrayM;
}
#pragma mark -
/**
 获取所有彩种的配置信息
 @[@{title:xxx,lotteryId:xxx},...]
 @return 配置信息
 */

+ (NSArray<NSDictionary *> *)allLotteryDataSource
{
    // 所有彩种
    NSMutableArray *lotteryList = [NSMutableArray array];
    // 赛车系列
    [lotteryList addObjectsFromArray:[self saicheSection]];
    // 时时彩系列
    [lotteryList addObjectsFromArray:[self shishiCaiSection]];
    // 香港彩系列
    [lotteryList addObjectsFromArray:[self hongkongCaiSection]];
    // 快三系列
    [lotteryList addObjectsFromArray:[self quickThreeSection]];
    // 11选5系列
    [lotteryList addObjectsFromArray:[self elevenSelectFiveSection]];
    // 快乐8系列
    [lotteryList addObjectsFromArray:[self happy8Section]];
    // 低频彩系列
    [lotteryList addObjectsFromArray:[self openSlowSection]];
    
    // 封单时间
    NSArray *allShowLotteryList = [lotteryList trend_map:^id(NSDictionary *dict) {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:dict];
        NSInteger lotteryId = [dict[@"lotteryId"] integerValue];
        // 彩种名称
        NSString *lotteryName = [NSString getLotteryName:lotteryId];
        dictM[@"id"] = dict[@"lotteryId"];
        dictM[@"title"] = lotteryName;
        dictM[@"lotteryName"] = lotteryName;
        dictM[@"lotteryCycleRemark"] = dict[@"desc"];
        dictM[@"remark"] = dict[@"desc"];
        dictM[@"logoUrl"] = dict[@"icon"];
        // 封单时间
        NSInteger sealTime = [NSString getTimeSealByLotteryID:lotteryId];
        dictM[@"sealTime"] = @(sealTime);
        return dictM;
    }];
    
    return allShowLotteryList;
}

/**
 获取所有彩种的名称数组
 @[重庆时时彩,...]
 @return 彩种清楚
 */
+ (NSArray<NSString *> *)allLotteryNames
{
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    NSMutableArray *nameList = [NSMutableArray array];
    NSArray *allLotteryInfos = [self allLotteryDataSource];
    for(NSDictionary *dict in allLotteryInfos){
        if (tempDict[dict[@"lotteryId"]] == nil) {
            tempDict[dict[@"lotteryId"]] = dict;
            [nameList addObject:dict[@"title"]];
        }
    }
    return nameList;
}

/**
 通过彩种名称获取彩种id
 
 @param lotteryName 彩种名称，必须是使用当前方法获取到的彩种名称，不支持自定义
 @return 彩种id
 */
+ (NSString *)getLotteryIdByLotteryName:(NSString *)lotteryName
{
    NSArray *allLotteryInfos = [self allLotteryDataSource];
    for(NSDictionary *dict in allLotteryInfos){
        if ([dict[@"title"] isEqualToString:lotteryName]) {
            return  [NSString stringWithFormat:@"%ld",[dict[@"lotteryId"] integerValue]];
        }
    }
    // 默认全部：0
    return @"0";
}
+ (NSInteger)getLotteryIntIdByLotteryName:(NSString *)lotteryName
{
    return [[self getLotteryIdByLotteryName:lotteryName] integerValue];
}

/**
 通过彩种id获取彩种名称
 
 @param lotteryId 彩种id
 @return 查找到的彩种名称
 */
+ (NSString *)getLotteryNameByLotteryId:(NSString *)lotteryId
{
    if([lotteryId isKindOfClass:[NSNumber class]]){
        lotteryId = [NSString stringWithFormat:@"%ld",[lotteryId integerValue]];
    }
    if (lotteryId == nil || ![lotteryId isKindOfClass:[NSString class]]) {
        return @"";
    }
    NSArray *allLotteryInfos = [self allLotteryDataSource];
    for(NSDictionary *dict in allLotteryInfos){
        if ([dict[@"lotteryId"] integerValue] == lotteryId.integerValue) {
            return dict[@"title"];
        }
    }
    return @"";
}
/**
 通过彩种id获取彩种名称
 
 @param lotId 彩种id
 @return 查找到的彩种名称
 */
+ (NSString *)getLotteryNameByIntLotteryId:(NSInteger )lotId
{
    NSString *lotteryId = [NSString stringWithFormat:@"%ld",lotId];
    return [self getLotteryNameByLotteryId:lotteryId];
}

/**
 通过彩种id获取彩种信息
 @{title:xxx,lotteryId:xxx}
 @param lotteryId 彩种id
 @return 彩种信息
 */
+ (NSDictionary *)getLotteryInfoByLotteryId:(NSString *)lotteryId
{
    return [self getLotteryInfoByIntLotteryId:[lotteryId integerValue]];
}
+ (NSDictionary *)getLotteryInfoByIntLotteryId:(NSInteger )lotteryId
{
    if (lotteryId <= 0) {
        return nil;
    }
    NSArray *allLotteryInfos = [self allLotteryDataSource];
    for(NSDictionary *dict in allLotteryInfos){
        if ([dict[@"lotteryId"] integerValue] == lotteryId) {
            return dict;
        }
    }
    return nil;
}
+ (NSDictionary *)allLotteryDict
{
    return @{@"title":@"全部",@"lotteryId":@(LotteryTypeMoreGame)};
}


/**
 获取玩法名称
 
 @param lotteryId 彩种id
 @param playMethodId 玩法id
 @return 玩法名称
 */
+ (NSString *)playMethodNameWithLotteryId:(LotteryType)lotteryId playMethodId:(NSInteger)playMethodId
{
    NSArray *allPlayMethodList = [self playMethodListWithLotteryId:lotteryId];
    
    NSArray *currentPlayMethodList = nil;
    for (NSArray *array in allPlayMethodList) {
        if ([[array objectAtIndex:0] intValue] == playMethodId) {
            currentPlayMethodList = array;
            break;
        }
    }
    if (currentPlayMethodList == nil) {
        return nil;
    }
    NSMutableString *playMethodName = nil;
    if (currentPlayMethodList.count>14) {
        playMethodName = currentPlayMethodList[14];
    }
    if ((lotteryId == LotteryTypeBJSCB || lotteryId == LotteryTypeBJSCC) && currentPlayMethodList.count>1) {
        playMethodName = currentPlayMethodList[1];
    }
    return playMethodName;
}
+ (NSArray *)playMethodListWithLotteryId:(LotteryType)lotteryId
{
    NSString *path;
    if (lotteryId > 0 && lotteryId < LotteryTypeGDX) {
        // 时时彩分分彩
        path = [[NSBundle mainBundle] pathForResource:@"SSC" ofType:@"csv"];
    } else if (lotteryId >= LotteryTypeGDX && lotteryId < LotteryTypeJSKS) {
        // 11选5
        path = [[NSBundle mainBundle] pathForResource:@"SYXW" ofType:@"csv"];
    } else if (lotteryId >= LotteryTypeJSKS && lotteryId < LotteryTypeBJSCA) {
        // 快三
        path = [[NSBundle mainBundle] pathForResource:@"KuaiSan" ofType:@"csv"];
    } else if (lotteryId >= LotteryTypeBJSCA && lotteryId < LotteryTypeBJSCB ) {
        // 赛车A/快艇A/飞艇A
        path = [[NSBundle mainBundle] pathForResource:@"pk10" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeBJSCC || lotteryId == LotteryTypeBJKTC
               || lotteryId == LotteryTypeKLKTC) {
        // C盘
        path = [[NSBundle mainBundle] pathForResource:@"beijin_pk10_message" ofType:@"csv"];
    } else if (lotteryId >= LotteryTypeBJSCB && lotteryId < LotteryTypeBJKL8) {
        // 赛车B/快艇B/飞艇B
        path = [[NSBundle mainBundle] pathForResource:@"BJPK10" ofType:@"csv"];
    } else if ([Helper isHappyEightGame:lotteryId]) {
        // 快乐8
        path = [[NSBundle mainBundle] pathForResource:@"Happy8" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeHNQXC) {
        // 海南七星彩
        path = [[NSBundle mainBundle] pathForResource:@"Star" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeFC3D) {
        // 福彩3D
        path = [[NSBundle mainBundle] pathForResource:@"3D" ofType:@"csv"];
    } else if (lotteryId == LotteryTypePL35) {
        // 排列35
        path = [[NSBundle mainBundle] pathForResource:@"PL3" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeSSQ) {
        // 双色球
        path = [[NSBundle mainBundle] pathForResource:@"SSQ" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeBJ28 || lotteryId == LotteryTypeHG28) {
        path = [[NSBundle mainBundle] pathForResource:@"Luck28" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeKLCQ) {
        path = [[NSBundle mainBundle] pathForResource:@"HappyMorra" ofType:@"csv"];
    } else if ([Helper isKLWFGame:lotteryId]) {
        path = [[NSBundle mainBundle] pathForResource:@"KLWF" ofType:@"csv"];
    } else if ([Helper isKenoGame:lotteryId]) {
        path = [[NSBundle mainBundle] pathForResource:@"KENO" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeCQSSCB || lotteryId == LotteryTypeCQSSCB) {
        path = [[NSBundle mainBundle] pathForResource:@"SSC_B" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeKLSSCB) {
        path = [[NSBundle mainBundle] pathForResource:@"SSC_HB" ofType:@"csv"];
    } else if (lotteryId == LotteryTypeLHC || lotteryId == LotteryTypeLHCKJB) {
        path = [[NSBundle mainBundle] pathForResource:@"MarkSix" ofType:@"csv"];
    }
    if (path == nil) {
        return nil;
    }
    return [NSArray arrayWithContentsOfDelimitedURL:[NSURL fileURLWithPath:path] options:0 delimiter:',' error:nil];
}
@end
