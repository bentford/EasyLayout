//
//  ButtonLabel.h
//
//
//  Created by Ben Ford on 1/17/13.
//  Copyright (c) 2013 Ben Ford All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonLabel : UIButton

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) NSLineBreakMode lineBreakMode;
@property (nonatomic, assign) NSTextAlignment textAlignment;

@property (nonatomic, assign) NSUInteger numberOfLines;
@end
