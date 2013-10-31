//
//  ButtonLabel.m
//
//
//  Created by Ben Ford on 1/17/13.
//  Copyright (c) 2013 Ben Ford All rights reserved.
//

#import "ButtonLabel.h"

@implementation ButtonLabel

- (id)init
{
    if ((self = [super init])) {
        
    }
    return self;
}

- (void)setText:(NSString *)text
{
    [self setTitle:text forState:UIControlStateNormal];
    
}

- (NSString *)text
{
    return [self titleForState:UIControlStateNormal];
}

- (void)setTextColor:(UIColor *)textColor
{
    [self setTitleColor:textColor forState:UIControlStateNormal];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self setTitleColor:textColor forState:UIControlStateDisabled];
}

- (UIColor *)textColor
{
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

- (UIFont *)font
{
    return self.titleLabel.font;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    self.titleLabel.lineBreakMode = lineBreakMode;
}

- (NSLineBreakMode)lineBreakMode
{
    return self.titleLabel.lineBreakMode;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    self.titleLabel.textAlignment = textAlignment;
}

- (NSTextAlignment)textAlignment
{
    return self.titleLabel.textAlignment;
}

- (void)setNumberOfLines:(NSUInteger)numberOfLines
{
    self.titleLabel.numberOfLines = numberOfLines;
}

- (NSUInteger)numberOfLines
{
    return self.titleLabel.numberOfLines;
}
@end
