//
//  ButtonMaker.h
//  EasyLayout
//
//  Created by Ben Ford on 10/31/12.
//  Copyright (c) 2013 Ben Ford
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <Foundation/Foundation.h>

@interface ButtonMaker : NSObject

#pragma mark - Generic Button for Testing
+ (UIButton *)genericButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
#pragma mark -

#pragma mark Image Only Buttons
+ (UIButton *)outerButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage
                    transparentOuterArea:(CGSize)outerArea;

+ (UIButton *)plainButtonWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

#pragma mark -

#pragma mark Text Buttons

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

#pragma mark -

#pragma mark Attributed Text Buttons
+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                      normalTextAttributes:(NSDictionary *)normalTextAttributes
                    selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                                   minSize:(CGSize)minSize __deprecated;

/**
 @param textOffset Used to offset the text for fonts that do not vertically center.
 
 Typographic bounds cause a line to appear uncentered.  This is the reason for the offset.
 
 From CoreText documentation:
   Image bounds represent the rectangle tightly enclosing the graphic shapes of the
   glyphs actually appearing in the line. Typographic bounds include the height of
   the ascenders in the font and the depth of its descenders, regardless of whether
   those features appear in the glyphs in a given line.
 
   For every font, glyph designers provide a set of measurements, called metrics, 
   which describe the spacing around each glyph in the font. These metrics determine
   glyph placement in a line. Line height is the total of ascent, descent, and leading.
 */
+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                      normalTextAttributes:(NSDictionary *)normalTextAttributes
                    selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                                   minSize:(CGSize)minSize
                                textOffset:(CGSize)textOffset;

+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                      normalTextAttributes:(NSDictionary *)normalTextAttributes
                    selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                                   padding:(CGSize)padding __deprecated;

/**
 @param textOffset Used to offset the text for fonts that do not vertically center.

 Typographic bounds cause a line to appear uncentered.  This is the reason for the offset.
 
 From CoreText documentation:
   Image bounds represent the rectangle tightly enclosing the graphic shapes of the
   glyphs actually appearing in the line. Typographic bounds include the height of
   the ascenders in the font and the depth of its descenders, regardless of whether
   those features appear in the glyphs in a given line.
 
   For every font, glyph designers provide a set of measurements, called metrics,
   which describe the spacing around each glyph in the font. These metrics determine
   glyph placement in a line. Line height is the total of ascent, descent, and leading.
 */
+ (UIButton *)textButtonWithAttributedText:(NSString *)text
                      normalTextAttributes:(NSDictionary *)normalTextAttributes
                    selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                               normalImage:(UIImage *)normalImage
                             selectedImage:(UIImage *)selectedImage
                                   padding:(CGSize)padding
                                textOffset:(CGSize)textOffset
                                   minSize:(CGSize)minSize;
#pragma mark -

#pragma mark Setting Text on Buttons
+ (void)setText:(NSString *)text forButton:(UIButton *)button maxSize:(CGSize)maxSize;
+ (void)setText:(NSString *)text forButton:(UIButton *)button maxWidth:(CGFloat)maxWidth;
+ (void)setText:(NSString *)text forButton:(UIButton *)button linebreakMode:(NSLineBreakMode)linebreakMode
                        constrainedToSize:(CGSize)constrainedToSize;
#pragma mark -
@end
