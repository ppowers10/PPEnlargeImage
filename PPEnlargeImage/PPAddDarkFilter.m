//
//  PPAddDarkFilter.m
//  PPEnlargeImage
//
//  Created by Powers, Patrick on 1/29/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "PPAddDarkFilter.h"

@implementation PPAddDarkFilter



-(UIImage *)captureBackgroundImage
{
    UIImage *outputImg = [self addDarkFilters];
    
    return outputImg;
    
}




-(UIImage *)addDarkFilters
{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootController = window.rootViewController;
    
    
    UIGraphicsBeginImageContext([[UIScreen mainScreen] bounds].size);
    [rootController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    CIImage *blurImg = [CIImage imageWithCGImage:viewImg.CGImage];
    
    
    CIFilter *lighten = [CIFilter filterWithName:@"CIColorControls"];
    [lighten setValue:blurImg forKey:kCIInputImageKey];
    [lighten setValue:@(-.5) forKey:@"inputBrightness"];
    [lighten setValue:@(0.3) forKey:@"inputSaturation"];
    [lighten setValue:@(0.1) forKey:@"inputContrast"];
    
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImg = [context createCGImage:lighten.outputImage fromRect:[blurImg extent]];
    
    
    return [UIImage imageWithCGImage:cgImg];
}


@end
