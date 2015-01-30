//
//  PPAddDarkFilter.h
//  PPEnlargeImage
//
//  Created by Powers, Patrick on 1/29/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface PPAddDarkFilter : NSObject

@property (strong, nonatomic) IBOutlet UIImageView *imgViewBackground;

-(UIImage *)captureBackgroundImage;

@end
