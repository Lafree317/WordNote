//
//  ContentViewController.m
//  WordNote
//
//  Created by 童浩 on 15/9/23.
//  Copyright © 2015年 Yoni. All rights reserved.
//

#import "ContentViewController.h"
#import "ContentView.h"
#import "CoreDataManagerHelp.h"

@interface ContentViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong)ContentView *rootView;

@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign)BOOL isTextViewFirstRespond;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isTextViewFirstRespond = YES;
    _rootView = [[ContentView alloc]initWithFrame:self.view.frame];
    if (self.content) {
        _rootView.textTitleField.text = self.content.title;
        _rootView.textView.text = self.content.content;
    }
    self.rootView.backgroundColor = [UIColor k_InterfaceColor];
    self.view = _rootView;
    _height = _rootView.textView.frame.size.height;
    [self addNavigationItems];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden) name:UIKeyboardDidHideNotification object:nil];
}


// 键盘弹出时
-(void)keyboardDidShow:(NSNotification *)notification{
    
    //获取键盘高度
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect;
    
    [keyboardObject getValue:&keyboardRect];
    if (_isTextViewFirstRespond == YES) {
        _isTextViewFirstRespond = NO;
        [_rootView.textView setFrame:CGRectMake(_rootView.textView.frame.origin.x,_rootView.textView.frame.origin.y,_rootView.textView.frame.size.width,_height - keyboardRect.size.height - 10)];
    }else{
        _isTextViewFirstRespond = YES;
    }
    
    //设置动画
    [UIView beginAnimations:nil context:nil];
    
    //定义动画时间
    [UIView setAnimationDuration:0.2];
    
}
//键盘消失时
-(void)keyboardDidHidden{
    //调整放置有textView的view的位置
    _isTextViewFirstRespond = YES;
    //设置动画
    [UIView beginAnimations:nil context:nil];
    //定义动画时间
    [UIView setAnimationDuration:0.2];
    //设置view的frame，往下平移
    [_rootView.textView setFrame:CGRectMake(_rootView.textView.frame.origin.x,_rootView.textView.frame.origin.y,_rootView.textView.frame.size.width,_height)];
    [UIView commitAnimations];
}


#pragma mark - 添加导航条按钮
- (void)addNavigationItems
{
    // 添加右上角按钮
    UIBarButtonItem *collection = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(collectionAction)];
    self.navigationItem.rightBarButtonItem = collection;
}
- (void)collectionAction{
    
    NSString *string = [_rootView.textTitleField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (string.length == 0) {
        [HUDHeaper addHUDInView:self.view text:@"请输入标题" hideAfterDelay:1];
        return;
    }
    if (self.content) {
        self.content.title = _rootView.textTitleField.text;
        self.content.content = _rootView.textView.text;
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] recomposeContent:self.content customFile:self.customFile];
            [HUDHeaper addHUDInView:self.view text:@"保存成功" hideAfterDelay:1];
    }else{
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] addCotentTitle:_rootView.textTitleField.text contentString:_rootView.textView.text customFile:self.customFile];
            [HUDHeaper addHUDInView:self.view text:@"保存成功" hideAfterDelay:1];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (alertView.tag == 1000) {
//        return;
//    }
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
