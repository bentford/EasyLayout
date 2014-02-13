//
//  ButtonMaker.h
//  EasyLayout
//
//  Created by Ben Ford on 10/31/12.
//  Copyright (c) 2012 Ben Ford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ButtonMaker : NSObject
+ (UIButton *)genericButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UIButton *)outerButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName
                        transparentOuterArea:(CGSize)outerArea;

+ (UIButton *)outerButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
                    transparentOuterArea:(CGSize)outerArea;

+ (UIButton *)plainButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;
+ (UIButton *)plainButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;


+ (UIButton *)textButtonWithText:(NSString *)text
                            font:(UIFont *)font
                 normalTextColor:(UIColor *)normalTextColor
               selectedTextColor:(UIColor *)selectedTextColor
                     normalImage:(UIImage *)normalImage
                   selectedImage:(UIImage *)selectedImage
                         padding:(CGSize)padding;

+ (UIButton *)textButtonWithText:(NSString *)text
                            font:(UIFont *)font
                 normalTextColor:(UIColor *)normalTextColor
               selectedTextColor:(UIColor *)selectedTextColor
                     normalImage:(UIImage *)normalImage
                   selectedImage:(UIImage *)selectedImage
                         minSize:(CGSize)minSize;

+ (void)setText:(NSString *)text forButton:(UIButton *)button maxSize:(CGSize)maxSize;
+ (void)setText:(NSString *)text forButton:(UIButton *)button maxWidth:(CGFloat)maxWidth;
+ (void)setText:(NSString *)text forButton:(UIButton *)button linebreakMode:(NSLineBreakMode)linebreakMode constrainedToSize:(CGSize)constrainedToSize;

@end
