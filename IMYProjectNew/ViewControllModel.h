//
//  ViewControllModel.h
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/16.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewControllModel : NSObject
+ (instancetype)viewModelWith;
-(RACCommand *)fetchUserInfoCommand;
@end
