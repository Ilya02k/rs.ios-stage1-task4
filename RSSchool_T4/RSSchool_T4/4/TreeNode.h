//
//  TreeNode.h
//  RSSchool_T4
//
//  Created by Илья Козлов on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (nonatomic, strong, nullable) TreeNode *left;
@property (nonatomic, strong, nullable) TreeNode *right;
@property (nonatomic, assign) int value;

-(instancetype)init: (int)value;

@end

NS_ASSUME_NONNULL_END
