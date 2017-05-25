//
//  TableViewC.h
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/15.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACCommand.h"
@interface TableViewC : UITableView<UITableViewDelegate,UITableViewDataSource>

- (void)setDidSelectedRowCommand:(RACCommand *)didSelectedRowCommand;

@end
