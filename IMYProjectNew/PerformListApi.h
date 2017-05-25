//
//  PerformListApi.h
//  XuanJueProject
//
//  Created by yadong zhao on 16/7/21.
//  Copyright © 2016年 zhanghao. All rights reserved.
//

#import "YTKRequest.h"

@interface PerformListApi : YTKRequest

- (id)initWithPerformList:(NSString *)professionId page:(NSString *)page;

@end
