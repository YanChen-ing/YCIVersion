//
//  OCViewController.m
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

#import "OCViewController.h"
#import <YCIVersion/YCIVersion-Swift.h>

#import <YCIVersion_Example-Swift.h>


@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self start];
    
    [self migrating];
    
    [self onlyOnceAlert];
    
}

/// YCIVersion 启动。执行部分其自身的版本化操作
- (void)start{
    
    [YCIVersionManager update];
    
}

/// 迁移
- (void)migrating{
    
    // 更改存储方案
//    Storage.TrueWorkerType = [MyStorage class];
    
    VersionOperation *startOperation = [[V1Creation alloc] init];
    
    [VersionOperation start:@"OC_example" version:3 operation:startOperation];
    
}


- (void)onlyOnceAlert {
    
    V2Guide *operation = [[V2Guide alloc] init];
    
    // 传入需要的信息
    operation.vc = self;
    operation.vcDescription = ^NSString * _Nonnull{
        return self.description;
    };
    
    [VersionOperation start:@"OC_V2Guide" version:4 operation:operation];
    
    
}



@end
