//
//  ContentViewController.h
//  WordNote
//
//  Created by 童浩 on 15/9/23.
//  Copyright © 2015年 Yoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Content.h"
#import "CustomFile.h"
@interface ContentViewController : UIViewController
@property (nonatomic, strong)Content *content;

@property (nonatomic, strong)CustomFile *customFile;
@end
