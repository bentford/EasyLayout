//
//  SizeButtonTests.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 10/31/13.
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
#import "EasyLayout.h"

@interface SizeButtonTests : XCTestCase

@end

@implementation SizeButtonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testSizeButton
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"This is a title";
    [EasyLayout sizeLabel:label mode:ELLineModeSingle maxWidth:200.0f];

    // passing test indicates that button sizing matches label sizing.
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newButton setTitle:@"This is a title" forState:UIControlStateNormal];
    newButton.titleLabel.font = label.font;
    [EasyLayout sizeButton:newButton mode:ELLineModeSingle maxWidth:200.0f];
    

    XCTAssertTrue(CGSizeEqualToSize(newButton.extSize, label.extSize),
                                    @"Button size was: %@, label size was: %@", NSStringFromCGSize(newButton.extSize),
                                                                                NSStringFromCGSize(label.extSize));
}

@end
