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
#import "HomeCollectionViewController.h"
#import "HomeCollectionViewCell.h"
#import "HeadReusableView.h"

@interface ViewController ()
{

}
@property (strong, nonatomic) ViewControllModel *viewModel;


@end
static NSString * const reuseIdentifier = @"collectioncell";
static NSString * const HeaderViewID = @"HeaderViewID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self fetchData];
       // Do any additional setup after loading the view, typically from a nib.
}

-(void)config{
//    @weakify(self);
//    TableViewC *login = [[TableViewC alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [login setDidSelectedRowCommand:[[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//        @strongify(self);
//        NSString *string = [NSString stringWithFormat:@"%@被点击啦哈哈哈",input];
//        UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleAlert];
//        [controller addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            
//        }]];
//        [self presentViewController:controller animated:YES completion:nil];
//        return [RACSignal empty];
//
//    }] ];
//
//    [self.view addSubview:login];
     int kNormalItemW =  (SCREEN_WIDTH- 3*10)/2;
     int kNormalItemH =  kNormalItemW *3 / 4;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置每个cell的大小
    layout.itemSize = CGSizeMake(kNormalItemW, kNormalItemH);
    //设置每个cell间的最小水平间距
    layout.minimumInteritemSpacing = 0;
    //设置每个cell间的行间距
    layout.minimumLineSpacing =10;
    //设置每一组距离四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(5, 10,10, 10);
    layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 50);
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT) collectionViewLayout:layout];
    collection.delegate=  self;
    collection.dataSource = self;

    [collection registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:reuseIdentifier];
    
[collection registerNib:[UINib nibWithNibName:@"HeadReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderViewID];
 
    [self.view addSubview:collection];
    [collection setBackgroundColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}
-(void)fetchData{
    
    self.viewModel =  [ViewControllModel viewModelWith];
    [[[self.viewModel fetchUserInfoCommand] execute:nil] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    // Configure the cell
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeadReusableView *head = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderViewID forIndexPath:indexPath];

    return head;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
