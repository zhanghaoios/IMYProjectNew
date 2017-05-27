//
//  ViewControllModel.m
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/16.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import "ViewControllModel.h"
#import "PandatvApi.h"
@implementation ViewControllModel

+ (instancetype)viewModelWith {
    ViewControllModel *viewModel = [ViewControllModel new];
    return viewModel;

}


- (RACCommand *)fetchUserInfoCommand {
    
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self fetchUserInfoSignal];
    }];
}



-(RACSignal *)fetchUserInfoSignal{
 
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        PandatvApi *pan = [[PandatvApi alloc] initWithApi];
        [pan startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
            
            NSLog(@"%@",[request.responseJSONObject objectForKey:@"data"]);

        } failure:^(__kindof YTKBaseRequest *request) {
            NSLog(@"%@",[request.responseJSONObject objectForKey:@"data"]);

        }];
        
        
//        [subscriber sendNext:@"网络数据"];
//        [subscriber sendCompleted];
        return nil;
    }];
}
@end
