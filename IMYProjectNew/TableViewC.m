//
//  TableViewC.m
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/15.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import "TableViewC.h"
#define ReuseIdentifier @"BlogCell"
#import "TableViewCell.h"




@interface TableViewC ()

@property (nonatomic,strong)RACCommand *didSelectedRowCommand;

@end


@implementation TableViewC

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame style:UITableViewStylePlain];

    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:ReuseIdentifier];
        [self setBackgroundColor:[UIColor blackColor]];
    };
    return self;

}

#pragma mark - UITableViewDataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *str = [NSString stringWithFormat:@"%ld被点击了",indexPath.row];
    [self.didSelectedRowCommand execute:str];
    
}
@end
