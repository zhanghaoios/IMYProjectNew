//
//  PandatvApi.m
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/26.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import "PandatvApi.h"

@implementation PandatvApi
- (id)initWithApi
{
    self = [super init];
    if (self) {

    }
    return self;

}
-(NSString *)requestUrl
{

    return PanTv;
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}
- (id)requestArgument {
    NSDictionary *requesrtDic =@{
                                        @"pagenum":@"4",
                                        @"hotroom":@"1",
                                        @"__version": @"1.1.7.1305",
                                        @"__plat": @"ios",
                                        @"__channel":@"appstore",
                                        };
    
    return requesrtDic;
    
}



@end
