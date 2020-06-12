//
//  UIUtils.h
//  WXTime
//
//  Created by wei.chen on 12-7-22.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#define REGEX_USER_NAME_LIMIT @"^.{3,10}$"          // 匹配类容是否在3~10位间
#define REGEX_USER_NAME @"[A-Za-z0-9]{3,10}"        // 匹配类容是否在3~10位间，并且是大小写字母、数字、
// ^[a-zA-Z0-9!@#%&*_]{6,12}$
#define REGEX_USER_PASSWORD @"^([a-zA-Z0-9!@#%&*_]){6,12}$"        // 密码正则表达式
#define REGEX_PHONE_DEFAULT @"^1[34578]\\d{9}$"                       // 匹配类容是否是电话号码
#define REGEX_EMAIL @"[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"         // 匹配类容是否是邮箱
#define REGEX_USER_NAME_CHESKER @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+"   // 匹配类容是否是汉字，数字，字母

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//获取documents下的文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName;

// date 格式化为 string
+ (NSString *) stringFromFomate:(NSDate*)date formate:(NSString*)formate;

// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;

//Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring;

//返回本机版本
+(float)OSVersion;

//获取字符串高度
+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

//获取字符串宽度
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

//MD5加密
+ (NSString *)md5:(NSString *)str;

//返回当前时间的时间戳
+ (NSString *)getCurrentDateStamp;

//返回指定时间13位时间戳
+ (NSString *)dateStampWithDate:(NSDate *)date;
+ (NSNumber *)dateStampNumberWithDate:(NSDate *)date;

//图片截取
+ (UIImage*) crop:(UIImage*)theImage;

//返回好多分钟前
+(NSString *) compareCurrentTime:(NSDate*) compareDate;

// 正则表达式
+ (BOOL)checkContent:(NSString *)content regex:(NSString *)regex;

// base64
+ (NSString*)encodeBase64String:(NSString*)input;
+ (NSString*)decodeBase64String:(NSString*)input;
+ (NSString*)encodeBase64Data:(NSData*)data;
+ (NSString*)decodeBase64Data:(NSData*)data;

// 拼接GET请求路径
+ (NSString *)generateURL:(NSString*)baseURL params:(NSDictionary*)params;

// 唯一标识
+ (NSString*)UUID;

// 获取设备型号
+ (NSString *)deviceModel;

// 获取pp版本
+ (NSString *)appVersion;

// 时间戳转时间
+ (NSDate *)dateFromTimestamp:(NSNumber *)timestamp;

// 时间戳转成固定格式时间字符串
+ (NSString *)dateStringWithTimestamp:(NSNumber *)Timestamp;

+ (NSString *)dateStringWithTimestamp:(NSNumber *)Timestamp formate:(NSString *)formate;

// 拨打电话
+ (void)callPhone:(NSString *)phone viewController:(UIViewController *)vc;

// 正则匹配返回符合要求的字符串 数组
+ (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr;


+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (NSString *)dateStringWithStartDate:(NSNumber *)sDate endDate:(NSNumber *)eDate;

// 格式化数字
+ (NSString *)stringFromNumber:(id)number;

// 字典转json
+ (NSString *)convertToJsonData:(NSDictionary *)dict;

// json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

// 某个角圆角
+ (void)roundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii view:(UIView *)view;

//四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;

//四舍五入类型(新)
+ (float)roundFloat:(float)price;

@end
