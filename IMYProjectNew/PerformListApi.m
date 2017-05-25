//
//  PerformListApi.m
//  XuanJueProject
//
//  Created by yadong zhao on 16/7/21.
//  Copyright © 2016年 zhanghao. All rights reserved.
//

#import "PerformListApi.h"
// 7.2.8艺人列表
#define PERFORM_LIST @"user/users/profession/firstscreen"

@implementation PerformListApi

{
    NSString *_professionId;
    NSString *_size;
    NSString *_page;
    
}
- (id)initWithPerformList:(NSString *)professionId page:(NSString *)page
{
    
    self = [super init];
    if (self) {
        _professionId = professionId;
        _page = page;
    }
    return self;
    
}
- (NSString *)requestUrl {
    
    return PERFORM_LIST;
}


- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 20;
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeHTTP;
}
- (id)requestArgument {

    NSMutableDictionary *requesrtDic = [[NSMutableDictionary alloc] initWithCapacity:10];
    

    [requesrtDic setObject:@"20" forKey:@"size"];
    if (_page != nil) {
        [requesrtDic setObject:_page forKey:@"page"];
    }
    [requesrtDic setObject:[ReadWriteUserInfoPlist getCurrentProfessionId] forKey:@"professionId"];

    return requesrtDic;
}


@end
