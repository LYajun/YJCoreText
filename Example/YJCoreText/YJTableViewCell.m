//
//  YJTableViewCell.m
//  CoreTextDemo
//
//  Created by 刘亚军 on 2019/11/19.
//  Copyright © 2019 刘亚军. All rights reserved.
//

#import "YJTableViewCell.h"
#import "YJDrawView.h"
#import <Masonry/Masonry.h>
#import <YJExtensions/YJExtensions.h>


@interface YJTableViewCell ()

@property (strong, nonatomic) UIButton *voiceBtn;
@property (strong, nonatomic) YJDrawView *drawView;
@end
@implementation YJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.drawView = [YJDrawView new];
        self.drawView.backgroundColor = [UIColor whiteColor];
        self.drawView.userInteractionEnabled = NO;
        [self.drawView yj_clipLayerWithRadius:0 width:1 color:[UIColor redColor]];
        [self.contentView addSubview:self.drawView];
        [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.contentView).offset(10);
            make.center.equalTo(self.contentView);
        }];
        
        
    }
    return self;
}
- (void)setCellWidth:(CGFloat)cellWidth{
    _cellWidth = cellWidth;
    self.drawView.frame = CGRectMake(0, 0, cellWidth-20, 0);
    
    NSMutableAttributedString *attr = @"自动布局自动计算高度：\n这是一个最好的时代，也是一个最坏的时代；这是明智的时代，这是愚昧的时代；这是信任的纪元，这是怀疑的纪元；这是光明的季节，这是黑暗的季节；这是希望的春日，这是失望的冬日；我们面前应有尽有，我们面前一".yj_toHtmlMutableAttributedString;
    [attr yj_setFont:17];
    
    [self.drawView addAttributedString:attr];
    [self.drawView addView:self.voiceBtn size:self.voiceBtn.frame.size align:(YJAttachmentAlignTypeCenter) clickActionHandler:nil];
}
- (void)setCellSelected:(BOOL)cellSelected{
    _cellSelected = cellSelected;
    self.voiceBtn.selected = cellSelected;
}
- (UIButton *)voiceBtn{
    if (!_voiceBtn) {
        _voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _voiceBtn.frame = CGRectMake(0, 0, 28, 28);
        [_voiceBtn setImage:[UIImage imageNamed:@"kc_btn_video"] forState:UIControlStateNormal];
        [_voiceBtn setImage:[UIImage yj_animatedImageNamed:@"kc_btn__video_gif" atDir:nil duration:1 atBundle:NSBundle.mainBundle] forState:UIControlStateSelected];
        //        [_voiceBtn addTarget:self action:@selector(voiceAction) forControlEvents:UIControlEventTouchUpInside];
        _voiceBtn.userInteractionEnabled = NO;
    }
    return _voiceBtn;
}
@end
