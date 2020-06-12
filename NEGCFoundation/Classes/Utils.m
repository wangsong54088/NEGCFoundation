//
//  UIUtils.m
//  WXTime
//
//  Created by wei.chen on 12-7-22.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#import "Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Utils

+ (NSString *)getDocumentsPath:(NSString *)fileName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documents = [paths objectAtIndex:0];
    NSString *path = [documents stringByAppendingPathComponent:fileName];
    
    return path;
}

+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:formate];
	NSString *str = [formatter stringFromDate:date];
	return str;
}

+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}


//Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formate = @"E MMM d HH:mm:ss Z yyyy";
    NSDate *createDate = [Utils dateFromFomate:datestring formate:formate];
    NSString *text = [Utils stringFromFomate:createDate formate:@"MM-dd HH:mm"];
    return text;
}

+(float)OSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

// 获取字符串高度
+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    //ios7.0前
//    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    
    //ios7
    CGSize detailsLabSize = CGSizeMake(width, MAXFLOAT);
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize sizeToFit = [value boundingRectWithSize:detailsLabSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return sizeToFit.height;
}

//获取字符串宽度
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    //ios7
    CGSize detailsLabSize = CGSizeMake(MAXFLOAT, height);
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize sizeToFit = [value boundingRectWithSize:detailsLabSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return sizeToFit.width;
}

+ (NSString *)md5:(NSString *)str
{
    const char *original_str = [str UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];
    
}

//返回当前时间的时间戳
+ (NSString *)getCurrentDateStamp
{
    NSDate *date = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

//返回指定时间13位时间戳
+ (NSString *)dateStampWithDate:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld000", (long)[date timeIntervalSince1970]];
    return timeSp;
}

+ (NSNumber *)dateStampNumberWithDate:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%ld000", (long)[date timeIntervalSince1970]];
    return @([timeSp longLongValue]);
}



//图片截取
+ (UIImage*) crop:(UIImage*)theImage{
    // Get size of current image
    CGSize size = [theImage size];
    
    // Create rectangle that represents a cropped image
    CGFloat desiredRatio = 1;
    
    CGFloat croppedWidth = 0.0;
    CGFloat croppedHeight = 0.0;
    
    CGRect rect;
    
    if (size.height/size.width >= desiredRatio) {
        croppedWidth = size.width;
        croppedHeight = size.width * desiredRatio;
        CGFloat difference = (size.height-croppedHeight)/2;
        rect = CGRectMake(0.0, difference ,croppedWidth, croppedHeight);
    }
    else{
        return theImage;
    }
    
    // Create bitmap image from original image data,
    // using rectangle to specify desired crop area
    CGImageRef imageRef = CGImageCreateWithImageInRect([theImage CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

+(NSString *)compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}

// 正则表达式
+ (BOOL)checkContent:(NSString *)content regex:(NSString *)regex
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:content];
}

+ (NSString *)encodeBase64String:(NSString*)input
{
    NSData *originData = [input dataUsingEncoding:NSASCIIStringEncoding];
    NSString *encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

+ (NSString *)decodeBase64String:(NSString*)input
{
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:input options:0];
    NSString *decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
    return decodeStr;
}

+ (NSString*)encodeBase64Data:(NSData*)data
{
    NSString *encodeResult = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

+ (NSString*)decodeBase64Data:(NSData*)data
{
    NSString *decodeStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    return decodeStr;
}

//

+ (NSString *)generateURL:(NSString*)baseURL params:(NSDictionary*)params
{
    if (params) {
        
        NSMutableArray* pairs = [NSMutableArray array];
        for (NSString* key in params.keyEnumerator) {
            
            NSString* value = [params objectForKey:key];
            value = [value isKindOfClass:[NSString class]] ? value:[NSString stringWithFormat:@"%@", value];
            CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes
            (NULL, /* allocator */
             (CFStringRef)value,
             NULL, /* charactersToLeaveUnescaped */
             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
             kCFStringEncodingUTF8));
            
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
        }
        
        NSString* query = [pairs componentsJoinedByString:@"&"];
        NSRange rang = [baseURL rangeOfString:@"?"];
        NSString* url = @"";
        if(rang.length >0){
            url = [NSString stringWithFormat:@"%@&%@", baseURL, query];
        }else{
            
            url = [NSString stringWithFormat:@"%@?%@", baseURL, query];
        }
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        return url;
        
    } else {
        return baseURL;
    }
}

// 唯一标识
+ (NSString*)UUID
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

// 获取设备型号
+ (NSString *)deviceModel
{
    return [UIDevice currentDevice].model;
}

// 获取pp版本
+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

// 时间戳转时间
+ (NSDate *)dateFromTimestamp:(NSNumber *)timestamp
{
    if ((!timestamp) || (![timestamp isKindOfClass:[NSNumber class]])) {
        return nil;
    }
    
    NSString *timestampString = [NSString stringWithFormat:@"%@", timestamp];
    if (timestampString.length > 11) {
        timestampString = [timestampString substringToIndex:10];
    }
    
    NSTimeInterval time = [timestampString longLongValue];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    date = [date dateByAddingTimeInterval:interval];
    
    return date;
}

+ (NSString *)dateStringWithTimestamp:(NSNumber *)Timestamp
{
    return [Utils dateStringWithTimestamp:Timestamp formate:@"yyyy-MM-dd"];
}

+ (NSString *)dateStringWithTimestamp:(NSNumber *)Timestamp formate:(NSString *)formate
{
    NSDate *docDate = [Utils dateFromTimestamp:Timestamp];
    NSString *dateString = [Utils stringFromFomate:docDate formate:formate];
    return dateString;
}

+ (void)callPhone:(NSString *)phone viewController:(UIViewController *)vc
{
//    if ([NSString isNullOrEmpty:phone] || (!vc)) {
//        return;
//    }
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@", phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [vc.view addSubview:callWebview];
}

/**
 *  正则匹配返回符合要求的字符串 数组
 *
 *  @param string   需要匹配的字符串
 *  @param regexStr 正则表达式
 *
 *  @return 符合要求的字符串 数组 (按(),分级,正常0)
 */


+ (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr
{
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    //match: 所有匹配到的字符,根据() 包含级
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in matches) {
        
        for (int i = 0; i < [match numberOfRanges]; i++) {
            //以正则中的(),划分成不同的匹配部分
            NSString *component = [string substringWithRange:[match rangeAtIndex:i]];
            
            [array addObject:component];
            
        }
        
    }
    
    return array;
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

+ (NSString *)dateStringWithStartDate:(NSNumber *)sDate endDate:(NSNumber *)eDate
{
    NSDate *startDate = [Utils dateFromTimestamp:sDate];
    NSDate *endDate = [Utils dateFromTimestamp:eDate];
    
    NSString *formate = @"yyyy年MM月dd日 HH:mm";
    // 当年
    if ([[Utils stringFromFomate:startDate formate:@"yyyy"] isEqualToString:[Utils stringFromFomate:[NSDate date] formate:@"yyyy"]]) {
        if ([[Utils stringFromFomate:startDate formate:@"HH:mm"] isEqualToString:@"00:00"]
            || [[Utils stringFromFomate:startDate formate:@"HH:mm"] isEqualToString:@"23:59"]) {
            formate = @"MM月dd日";
        } else {
            formate = @"MM月dd日 HH:mm";
        }
        
    }
    // 不是当年
    else {
        if ([[Utils stringFromFomate:startDate formate:@"HH:mm"] isEqualToString:@"00:00"]
            || [[Utils stringFromFomate:startDate formate:@"HH:mm"] isEqualToString:@"23:59"]) {
            formate = @"yyyy年MM月dd日";
        } else {
            formate = @"yyyy年MM月dd日 HH:mm";
        }
    }
    NSString * timeString = [NSString stringWithFormat:@"%@   ~   %@", [Utils stringFromFomate:startDate formate:formate], [Utils stringFromFomate:endDate formate:formate]];
    
    return timeString;
}

+ (NSString *)stringFromNumber:(id)number
{
    NSString *str = @"0";
    if ((!number) || [number isEqual:[NSNull null]]) {
        return str;
    }
    CGFloat n = [number floatValue];
    if (n == 0) {
        return str;
    }
//    else if (n > 10000) {
//        str = [NSString stringWithFormat:@"%.2fW", n/10000];
//    }
    else {
        str = [NSString stringWithFormat:@"%.2f", n];
    }
    
    return str;
}

+ (NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+ (void)roundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii view:(UIView *)view
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

//格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}

//四舍五入类型(新)
+ (float)roundFloat:(float)price{
    return (floorf(price*100 + 0.5))/100;
}

@end
