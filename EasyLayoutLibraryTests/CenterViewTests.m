//
//  CenterViewTests.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 10/25/13.
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

@interface CenterViewTests : XCTestCase

@end

@implementation CenterViewTests

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

- (void)testTopCenterViews
{
    UIView *parent = [[UIView alloc] init];
    parent.extSize = CGSizeMake(500.0f, 500.0f);
    
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(100.0f, 100.0f);
    
    UIView *two = [[UIView alloc] init];
    two.extSize = CGSizeMake(100.0f, 100.0f);
    
    [EasyLayout topCenterViews:@[one,two] inParentView:parent offset:CGSizeZero padding:0.0f];
    XCTAssertEqual(one.extOrigin.x, 150.0f, @"incorrect origin: %1.2f", one.extOrigin.x);
    XCTAssertEqual(two.extOrigin.x, 250.0f, @"incorrect origin: %1.2f", two.extOrigin.x);
}


- (void)testTopCenterViewsWithPadding
{
    UIView *parent = [[UIView alloc] init];
    parent.extSize = CGSizeMake(500.0f, 500.0f);
    
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(100.0f, 100.0f);
    
    UIView *two = [[UIView alloc] init];
    two.extSize = CGSizeMake(100.0f, 100.0f);
    
    [EasyLayout topCenterViews:@[one,two] inParentView:parent offset:CGSizeZero padding:10.0f];
    XCTAssertEqual(one.extOrigin.x, 145.0f, @"incorrect origin: %1.2f", one.extOrigin.x);
    XCTAssertEqual(two.extOrigin.x, 255.0f, @"incorrect origin: %1.2f", two.extOrigin.x);
}

- (void)testCenterViewInParentInbetweenVertically
{
    UIView *parent = [[UIView alloc] init];
    parent.extSize = CGSizeMake(500.0f, 500.0f);
    
    UIView *first = [[UIView alloc] init];
    first.extSize = CGSizeMake(10.0f, 10.0f);
    first.extOrigin = CGPointMake(0.0f, 0.0f);
    
    UIView *second = [[UIView alloc] init];
    second.extSize = CGSizeMake(100.0f, 100.0f);
    second.extOrigin = CGPointMake(0.0f, 500.0f);
    
    UIView *targetView = [[UIView alloc] init];
    targetView.extSize = CGSizeMake(100.0f, 100.0f);
    
    [EasyLayout centerView:targetView inParentView:parent inbetweenVerticallyFirstView:first secondView:second
                    offset:CGSizeZero];
    
    XCTAssertEqual(targetView.extMedial.x, parent.extHalfSize.width, @"incorrect origin: %1.2f", targetView.extMedial.x);
}

- (void)testCenterViewInParentInbetweenVerticallyWithNilFirstView
{
    UIView *parent = [[UIView alloc] init];
    parent.extSize = CGSizeMake(500.0f, 500.0f);
    
    UIView *second = [[UIView alloc] init];
    second.extSize = CGSizeMake(100.0f, 100.0f);
    second.extOrigin = CGPointMake(0.0f, 500.0f);
    
    UIView *targetView = [[UIView alloc] init];
    targetView.extSize = CGSizeMake(100.0f, 100.0f);
    
    [EasyLayout centerView:targetView inParentView:parent inbetweenVerticallyFirstView:nil secondView:second
                    offset:CGSizeZero];
    
    XCTAssertEqual(targetView.extMedial.x, parent.extHalfSize.height, @"incorrect origin: %1.2f", targetView.extMedial.x);
}

@end
