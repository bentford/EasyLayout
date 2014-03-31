//
//  SizeAttributedTextTest.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 1/9/14.
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

#import <XCTest/XCTest.h>
#import <CoreText/CoreText.h>
#import "EasyLayout.h"

@interface SizeAttributedTextTest : XCTestCase

@end

@implementation SizeAttributedTextTest
- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    
    
    // this goes last
    [super tearDown];
}

- (void)testRegularString
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"hello world";
    label.font = [UIFont systemFontOfSize:12.0f];
    [EasyLayout sizeLabel:label mode:ELLineModeSingle maxWidth:320.0f];
    
    XCTAssertTrue(label.extWidth == 59.0f, @"label is %1.2f", label.extWidth);
}

- (void)testAttributedString
{
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithString:@"hello world"
                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
    
    UILabel *label = [[UILabel alloc] init];
    label.attributedText= attributedString;
    [EasyLayout sizeLabel:label mode:ELLineModeSingle maxWidth:320.0f];
    
    XCTAssertTrue(label.extWidth == 59.0f, @"label is %1.2f", label.extWidth);
}

- (void)testAttributedStringWithColor
{
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithString:@"hello world"
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],
                                                         NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UILabel *label = [[UILabel alloc] init];
    label.attributedText= attributedString;
    [EasyLayout sizeLabel:label mode:ELLineModeSingle maxWidth:320.0f];
    
    XCTAssertTrue(label.extWidth == 59.0f, @"label is %1.2f", label.extWidth);
}

- (void)testAttributedStringWithSuperscript
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                            initWithString:@"hello world1"
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],
                                                         NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [attributedString addAttribute:(NSString *)kCTSuperscriptAttributeName value:@(1) range:NSMakeRange(10, 1)];
    
    UILabel *label = [[UILabel alloc] init];
    label.attributedText = attributedString;
    [EasyLayout sizeLabel:label mode:ELLineModeSingle maxWidth:420.0f];
    
    XCTAssertTrue(label.extWidth == 66.0f, @"label is %1.2f", label.extWidth);
}
@end
