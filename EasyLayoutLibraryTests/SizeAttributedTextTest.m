//
//  SizeAttributedTextTest.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 1/9/14.
//  Copyright (c) 2014 Ben Ford. All rights reserved.
//

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
