//
//  YJViewController.m
//  YJCoreText
//
//  Created by lyj on 11/19/2019.
//  Copyright (c) 2019 lyj. All rights reserved.
//

#import "YJViewController.h"
#import <Masonry/Masonry.h>
#import <YJExtensions/YJExtensions.h>
#import "YJTableViewCell.h"
#import "YJDrawView.h"
@interface YJViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) YJDrawView *drawView;
@end

@implementation YJViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self testTableView];
}
- (void)testTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:YJTableViewCell.class forCellReuseIdentifier:NSStringFromClass(YJTableViewCell.class)];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)testCoreText{
    self.drawView = [YJDrawView new];
    self.drawView.backgroundColor = [UIColor whiteColor];
    [self.drawView yj_clipLayerWithRadius:0 width:1 color:[UIColor redColor]];
    
    [self.view addSubview:self.drawView];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_equalTo(100);
        make.centerX.left.equalTo(self.view);
        make.height.mas_greaterThanOrEqualTo(300);
    }];
    
    [self.drawView addString:@"Hello World " attributes:self.defaultTextAttributes clickActionHandler:^(id  _Nonnull obj) {
        NSLog(@"%@",obj);
    }];
    
    [self.drawView addAttributedString:@"<font color=\"#333333\">The criminal was punished with <font color=\"#17b0f8\">severity</font>.</font>".yj_toHtmlMutableAttributedString];
    
    __weak typeof(self) weakSelf = self;
    [self.drawView addImage:[UIImage imageNamed:@"tata_img_hottopicdefault"] size:CGSizeMake(30, 30) clickActionHandler:^(id obj) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"图片点击" message:[NSString stringWithFormat:@"点击对象%@", obj] preferredStyle:(UIAlertControllerStyleAlert)];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil]];
        [weakSelf presentViewController:alert animated:YES completion:nil];
    }];
    
    // 添加链接
    [self.drawView addLink:@"http://www.baidu.com" clickActionHandler:^(id obj) {
        
    }];
    
    // 添加普通的文本
    [self.drawView addString:@"这是一个最好的时代，也是一个最坏的时代；" attributes:self.defaultTextAttributes];
    
    // 添加链接
    [self.drawView addLink:@" 这是明智的时代，这是愚昧的时代；这是信任的纪元，这是怀疑的纪元；这是光明的季节，这是黑暗的季节；这是希望的春日，这是失望的冬日； " clickActionHandler:^(id obj) {
        
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(YJTableViewCell.class) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.cellWidth = self.view.width;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YJTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cellSelected = !cell.cellSelected;
}


- (NSDictionary *)defaultTextAttributes {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18],
                                 NSForegroundColorAttributeName: [UIColor blackColor]
                                 };
    return attributes;
}

- (NSDictionary *)boldHighlightedTextAttributes {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:24],
                                 NSForegroundColorAttributeName: [UIColor redColor],
                                 };
    return attributes;
}

- (NSDictionary *)linkTextAttributes {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18],
                                 NSForegroundColorAttributeName: [UIColor blueColor],
                                 NSUnderlineStyleAttributeName: @1,
                                 NSUnderlineColorAttributeName: [UIColor blueColor],
                                 };
    return attributes;
}
@end
