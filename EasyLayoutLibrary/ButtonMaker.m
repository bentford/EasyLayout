//
//  ButtonMaker.m
//  EasyLayout
//
//  Created by Ben Ford on 10/31/12.
//  Copyright (c) 2012 Ben Ford. All rights reserved.
//


#import "ButtonMaker.h"

@implementation ButtonMaker

#pragma mark - Generic Button for Testing

+ (UIButton *)genericButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *newButton = [ButtonMaker textButtonWithText:title
                                                     font:[UIFont systemFontOfSize:25.0f]
                                          normalTextColor:[UIColor whiteColor]
                                        selectedTextColor:[UIColor blackColor]
                                          normalImage:nil
                                            selectedImage:nil
                           padding:CGSizeZero];
    
    [newButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return newButton;
}

#pragma mark -

#pragma mark Image Only Buttons


+ (UIButton *)outerButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
                        transparentOuterArea:(CGSize)outerArea
{
    UIButton *newButton = [ButtonMaker plainButtonWithNormalImage:normalImage selectedImage:selectedImage];
    newButton.frame = CGRectMake(0.0f, 0.0f,
                                 newButton.frame.size.width + outerArea.width,
                                 newButton.frame.size.height + outerArea.height);
    
    return newButton;
}

+ (UIButton *)plainButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setImage:normalImage forState:UIControlStateNormal];
    if (selectedImage != nil) {
        [newButton setImage:selectedImage forState:UIControlStateHighlighted];
        [newButton setImage:selectedImage forState:UIControlStateSelected];
    }
    
    newButton.frame = CGRectMake(0.0f, 0.0f, normalImage.size.width, normalImage.size.height);
    
    return newButton;
}

#pragma mark -

#pragma mark Text Buttons

+ (UIButton *)textButtonWithText:(NSString *)text
                            font:(UIFont *)font
                           normalTextColor:(UIColor *)normalTextColor
                         selectedTextColor:(UIColor *)selectedTextColor
                     normalImage:(UIImage *)normalImage
                   selectedImage:(UIImage *)selectedImage
                         padding:(CGSize)padding
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // setup colors
    [newButton setTitleColor:normalTextColor forState:UIControlStateNormal];
    [newButton setTitleColor:selectedTextColor forState:UIControlStateSelected];
    [newButton setTitleColor:selectedTextColor forState:UIControlStateHighlighted];
    
    [newButton setTitleColor:[UIColor colorWithWhite:0.5f alpha:1.0f] forState:UIControlStateDisabled];
    
    // setup font
    newButton.titleLabel.font = font;
    
    // set images if they were specified
    if (normalImage != nil)
        [newButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    if (selectedImage != nil)
        [newButton setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    
    // size button via text
    [ButtonMaker setText:text forButton:newButton maxWidth:CGFLOAT_MAX];
    
    // determine minimum sizes
    CGFloat largestHeight = MAX(newButton.frame.size.height, normalImage.size.height);
    CGFloat largestWidth = MAX(newButton.frame.size.width, normalImage.size.width);
    
    newButton.frame = CGRectMake(0.0f, 0.0f, largestWidth+padding.width, largestHeight+padding.height);
    
    return newButton;
}

+ (UIButton *)textButtonWithText:(NSString *)text
                            font:(UIFont *)font
                           normalTextColor:(UIColor *)normalTextColor
                         selectedTextColor:(UIColor *)selectedTextColor
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                                   minSize:(CGSize)minSize
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // setup colors
    [newButton setTitleColor:normalTextColor forState:UIControlStateNormal];
    [newButton setTitleColor:selectedTextColor forState:UIControlStateSelected];
    [newButton setTitleColor:selectedTextColor forState:UIControlStateHighlighted];
    
    [newButton setTitleColor:[UIColor colorWithWhite:0.5f alpha:1.0f] forState:UIControlStateDisabled];
    
    // setup font
    newButton.titleLabel.font = font;
    
    // set images if they were specified
    if (normalImage != nil)
        [newButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    if (selectedImage != nil)
        [newButton setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    
    // size button via text
    [ButtonMaker setText:text forButton:newButton maxWidth:CGFLOAT_MAX];
    
    // determine minimum sizes
    CGFloat largestHeight = MAX(MAX(newButton.frame.size.height, normalImage.size.height), minSize.height);
    CGFloat largestWidth = MAX(MAX(newButton.frame.size.width, normalImage.size.width), minSize.width);
    
    newButton.frame = CGRectMake(0.0f, 0.0f, largestWidth, largestHeight);
    
    return newButton;
}

#pragma mark -

#pragma mark Attributed Text Buttons


+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                      normalTextAttributes:(NSDictionary *)normalTextAttributes
                    selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                         minSize:(CGSize)minSize
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    NSAttributedString *normalAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                 attributes:normalTextAttributes];
    
    NSAttributedString *selectedAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                   attributes:selectedTextAttributes];
    
    // build a disabled state
    NSDictionary *disabledAttributes = @{NSKernAttributeName:normalTextAttributes[NSKernAttributeName],
                                         NSFontAttributeName:normalTextAttributes[NSFontAttributeName],
                                         NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5f alpha:1.0f]};
    
    NSAttributedString *disabledAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                   attributes:disabledAttributes];
    
    // set images if they were specified
    if (normalImage != nil)
        [newButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    if (selectedImage != nil)
        [newButton setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    
    // size button via text
    [ButtonMaker setAttributedText:normalAttributedString forButton:newButton maxWidth:CGFLOAT_MAX];
    
    // set alternate state strings
    [newButton setAttributedTitle:selectedAttributedString forState:UIControlStateSelected];
    [newButton setAttributedTitle:selectedAttributedString forState:UIControlStateHighlighted];
    [newButton setAttributedTitle:disabledAttributedString forState:UIControlStateDisabled];
    
    // determine minimum sizes
    CGFloat largestHeight = MAX(MAX(newButton.frame.size.height, normalImage.size.height), minSize.height);
    CGFloat largestWidth = MAX(MAX(newButton.frame.size.width, normalImage.size.width), minSize.width);
    
    newButton.frame = CGRectMake(0.0f, 0.0f, largestWidth, largestHeight);
    
    return newButton;
}

+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                 normalTextAttributes:(NSDictionary *)normalTextAttributes
               selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                     normalImage:(UIImage *)normalImage
                   selectedImage:(UIImage *)selectedImage
                         padding:(CGSize)padding
{
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    NSAttributedString *normalAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                 attributes:normalTextAttributes];
    
    NSAttributedString *selectedAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                 attributes:selectedTextAttributes];
    
    // build a disabled state
    NSDictionary *disabledAttributes = @{NSKernAttributeName:normalTextAttributes[NSKernAttributeName],
                                         NSFontAttributeName:normalTextAttributes[NSFontAttributeName],
                                         NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5f alpha:1.0f]};
                                         
    NSAttributedString *disabledAttributedString = [[NSAttributedString alloc] initWithString:text
                                                                                   attributes:disabledAttributes];
    
    // set images if they were specified
    if (normalImage != nil)
        [newButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    if (selectedImage != nil)
        [newButton setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    
    // size button via text
    [ButtonMaker setAttributedText:normalAttributedString forButton:newButton maxWidth:CGFLOAT_MAX];
    
    // set alternate state strings
    [newButton setAttributedTitle:selectedAttributedString forState:UIControlStateSelected];
    [newButton setAttributedTitle:selectedAttributedString forState:UIControlStateHighlighted];
    [newButton setAttributedTitle:disabledAttributedString forState:UIControlStateDisabled];
    
    // determine minimum sizes
    CGFloat largestHeight = MAX(newButton.frame.size.height, normalImage.size.height);
    CGFloat largestWidth = MAX(newButton.frame.size.width, normalImage.size.width);
    
    newButton.frame = CGRectMake(0.0f, 0.0f, largestWidth+padding.width, largestHeight+padding.height);
    
    return newButton;
}

#pragma mark -

#pragma mark Setting Text on Buttons


+ (void)setText:(NSString *)text forButton:(UIButton *)button maxSize:(CGSize)maxSize
{
    [self setText:text forButton:button linebreakMode:NSLineBreakByWordWrapping constrainedToSize:maxSize];
}

+ (void)setText:(NSString *)text forButton:(UIButton *)button maxWidth:(CGFloat)maxWidth
{
    [self setText:text forButton:button linebreakMode:NSLineBreakByTruncatingTail
            constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

+ (void)setText:(NSString *)text forButton:(UIButton *)button linebreakMode:(NSLineBreakMode)linebreakMode
                constrainedToSize:(CGSize)constrainedToSize
{
    // the normalized text is used to calculate on something if incoming text was blank
    BOOL containsText = (text != nil && [[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0);
    NSString *normalizedText = containsText ? text : @"MMM";
    
    CGSize textSize;
    switch (linebreakMode) {
        case NSLineBreakByWordWrapping:
        case NSLineBreakByCharWrapping:

            // iOS7 and up
            if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
                textSize = [normalizedText boundingRectWithSize:constrainedToSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:button.titleLabel.font}
                    
                                                        context:nil].size;
                
            // iOS6 and below
            } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                textSize = [normalizedText sizeWithFont:button.titleLabel.font constrainedToSize:constrainedToSize
                                lineBreakMode:linebreakMode];
#pragma clang diagnostic pop
            }
            
            break;
        case NSLineBreakByClipping:
        case NSLineBreakByTruncatingHead:
        case NSLineBreakByTruncatingMiddle:
        case NSLineBreakByTruncatingTail:
            // iOS7 and up
            if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
                textSize = [text boundingRectWithSize:CGSizeMake(constrainedToSize.width, CGFLOAT_MAX)
                                              options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:button.titleLabel.font}
                                              context:nil].size;
            // iOS6 and below
            } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                textSize = [text sizeWithFont:button.titleLabel.font forWidth:constrainedToSize.width
                                lineBreakMode:linebreakMode];
#pragma clang diagnostic pop  
            }
            break;
    }
    
    // don't actually use the normalized text
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = linebreakMode;
    button.frame = CGRectMake(button.frame.origin.x,button.frame.origin.y,textSize.width,textSize.height);
}

+ (void)setAttributedText:(NSAttributedString *)text forButton:(UIButton *)button maxSize:(CGSize)maxSize
{
    [self setAttributedText:text forButton:button linebreakMode:NSLineBreakByWordWrapping constrainedToSize:maxSize];
}

+ (void)setAttributedText:(NSAttributedString *)text forButton:(UIButton *)button maxWidth:(CGFloat)maxWidth
{
    [self setAttributedText:text forButton:button linebreakMode:NSLineBreakByTruncatingTail
          constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
}

+ (void)setAttributedText:(NSAttributedString *)attributedText
                forButton:(UIButton *)button
            linebreakMode:(NSLineBreakMode)linebreakMode
        constrainedToSize:(CGSize)constrainedToSize
{
    
    CGSize textSize;
    switch (linebreakMode) {
        case NSLineBreakByWordWrapping:
        case NSLineBreakByCharWrapping:
            textSize = [attributedText boundingRectWithSize:constrainedToSize
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                    context:nil].size;
            break;
            
        case NSLineBreakByClipping:
        case NSLineBreakByTruncatingHead:
        case NSLineBreakByTruncatingMiddle:
        case NSLineBreakByTruncatingTail:
            textSize = [attributedText boundingRectWithSize:CGSizeMake(constrainedToSize.width, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                                    context:nil].size;
            break;
    }
    
    textSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    
    [button setAttributedTitle:attributedText forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = linebreakMode;
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, textSize.width, textSize.height);
}
#pragma mark -
@end
