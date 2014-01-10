//
//  ButtonMaker.m
//  EasyLayout
//
//  Created by Ben Ford on 10/31/12.
//  Copyright (c) 2012 Ben Ford. All rights reserved.
//


#import "ButtonMaker.h"

@implementation ButtonMaker
+ (UIButton *)genericButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *newButton = [ButtonMaker textButtonWithText:title
                                                     font:[UIFont systemFontOfSize:25.0f] color:[UIColor colorWithRed:27.0f/255.0f green:119.0f/255.0f blue:255.0f/255.0f alpha:1.0f]
                                          normalImage:nil selectedImage:nil];
    
    [newButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return newButton;
}

+ (UIButton *)plainButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setImage:normalImage forState:UIControlStateNormal];
    if (selectedImage != nil)
        [newButton setImage:selectedImage forState:UIControlStateHighlighted];
    
    newButton.frame = CGRectMake(0.0f, 0.0f, normalImage.size.width, normalImage.size.height);
    
    return newButton;
}

+ (UIButton *)textButtonWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color
                     normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [newButton setTitleColor:color forState:UIControlStateNormal];
    [newButton setTitleColor:[UIColor colorWithWhite:0.8f alpha:1.0f] forState:UIControlStateHighlighted];
    [newButton setTitleColor:[UIColor colorWithWhite:0.8f alpha:1.0f] forState:UIControlStateDisabled];
    newButton.titleLabel.font = font;
    
    // set images if they were specified
    if (normalImage != nil)
        [newButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    if (selectedImage != nil)
        [newButton setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    
    // size button via text
    [ButtonMaker setText:text forButton:newButton maxWidth:CGFLOAT_MAX];
    
    // override size with image if it was supplied
    if (normalImage != nil)
        newButton.frame = CGRectMake(0.0f, 0.0f, normalImage.size.width, normalImage.size.height);
    
    return newButton;
}

+ (UIButton *)plainButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName
{
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setImage:normalImage forState:UIControlStateNormal];
    if (selectedImage != nil)
        [newButton setImage:selectedImage forState:UIControlStateSelected];
    
    newButton.frame = CGRectMake(0.0f, 0.0f, normalImage.size.width, normalImage.size.height);
    
    return newButton;
}


+ (UIButton *)outerButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName transparentOuterArea:(CGSize)outerArea
{
    UIButton *newButton = [ButtonMaker plainButtonWithNormalImageName:normalImageName selectedImageName:selectedImageName];
    newButton.frame = CGRectMake(0.0f, 0.0f, newButton.frame.size.width+outerArea.width, newButton.frame.size.height+outerArea.height);
    
    return newButton;
}

+ (void)setText:(NSString *)text forButton:(UIButton *)button maxSize:(CGSize)maxSize
{
    [self setText:text forButton:button linebreakMode:NSLineBreakByWordWrapping constrainedToSize:maxSize];
}

+ (void)setText:(NSString *)text forButton:(UIButton *)button maxWidth:(CGFloat)maxWidth
{
    [self setText:text forButton:button linebreakMode:NSLineBreakByTruncatingTail constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

+ (void)setText:(NSString *)text forButton:(UIButton *)button linebreakMode:(NSLineBreakMode)linebreakMode constrainedToSize:(CGSize)constrainedToSize
{
    // the normalized text is used to calculate on something if incoming text was blank
    BOOL containsText = (text != nil && [[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0);
    NSString *normalizedText = containsText ? text : @"MMM";
    
    // NewHouse and Futura fonts have a bug so pad them in the end
    normalizedText = [NSString stringWithFormat:@"%@ ", normalizedText];
    
    CGSize textSize;
    switch (linebreakMode) {
        case NSLineBreakByWordWrapping:
        case NSLineBreakByCharWrapping:
            if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
                textSize = [text boundingRectWithSize:constrainedToSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:button.titleLabel.font}
                                              context:nil].size;
            else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                textSize = [text sizeWithFont:button.titleLabel.font constrainedToSize:constrainedToSize
                                lineBreakMode:linebreakMode];
#pragma clang diagnostic pop
            
            break;
        case NSLineBreakByClipping:
        case NSLineBreakByTruncatingHead:
        case NSLineBreakByTruncatingMiddle:
        case NSLineBreakByTruncatingTail:
            if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])
                textSize = [text boundingRectWithSize:CGSizeMake(constrainedToSize.width, CGFLOAT_MAX)
                                              options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:button.titleLabel.font}
                                              context:nil].size;
            else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                textSize = [text sizeWithFont:button.titleLabel.font forWidth:constrainedToSize.width
                                lineBreakMode:linebreakMode];
#pragma clang diagnostic pop            
            break;
    }
    
    // don't actually use the normalized text
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = linebreakMode;
    button.frame = CGRectMake(button.frame.origin.x,button.frame.origin.y,textSize.width,textSize.height);
}

@end
