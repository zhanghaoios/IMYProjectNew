//
//  ViewController.m
//  IMYProjectNew
//
//  Created by 张浩 on 2017/5/11.
//  Copyright © 2017年 张浩. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "TableViewC.h"
#import "ViewControllModel.h"

@interface ViewController ()
@property (strong, nonatomic) ViewControllModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self fetchData];
       // Do any additional setup after loading the view, typically from a nib.
}

-(void)config{
    @weakify(self);
    TableViewC *login = [[TableViewC alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [login setDidSelectedRowCommand:[[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSString *string = [NSString stringWithFormat:@"%@被点击啦哈哈哈",input];
        UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:controller animated:YES completion:nil];
        return [RACSignal empty];

    }] ];

    [self.view addSubview:login];
}
-(void)fetchData{
    
    self.viewModel =  [ViewControllModel viewModelWith];
    [[[self.viewModel fetchUserInfoCommand] execute:nil] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
