//
//  InspectorTests.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 10/24/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EasyLayout.h"

@interface InspectorTests : XCTestCase

@end

@implementation InspectorTests

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

- (void)testSingleViewNoPadding
{
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(100.0f, 100.0f);
    
    CGFloat total = [EasyLayout totalWidthForViews:@[one] padding:0.0f];
    XCTAssertEqual(total, 100.0f, @"incorrect width: %1.2f", total);
}

- (void)testMultipleViewsNoPadding
{
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(100.0f, 100.0f);
    
    UIView *two = [[UIView alloc] init];
    two.extSize = CGSizeMake(120.0f, 100.0f);
    
    CGFloat total = [EasyLayout totalWidthForViews:@[one,one] padding:0.0f];
    XCTAssertEqual(total, 200.0f, @"incorrect width: %1.2f", total);
    
    total = [EasyLayout totalWidthForViews:@[one,one,one] padding:0.0f];
    XCTAssertEqual(total, 300.0f, @"incorrect width: %1.2f", total);
    
    total = [EasyLayout totalWidthForViews:@[one,two,one,two] padding:0.0f];
    XCTAssertEqual(total, 440.0f, @"incorrect width: %1.2f", total);
}

- (void)testMultipleViewsWithPadding
{
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(100.0f, 100.0f);
    
    UIView *two = [[UIView alloc] init];
    two.extSize = CGSizeMake(120.0f, 100.0f);
    
    CGFloat total = [EasyLayout totalWidthForViews:@[one,one] padding:10.0f];
    XCTAssertEqual(total, 210.0f, @"incorrect width: %1.2f", total);
    
    total = [EasyLayout totalWidthForViews:@[one,one,one] padding:25.0f];
    XCTAssertEqual(total, 350.0f, @"incorrect width: %1.2f", total);
    
    total = [EasyLayout totalWidthForViews:@[one,two,one,two] padding:1.0f];
    XCTAssertEqual(total, 443.0f, @"incorrect width: %1.2f", total);
}

- (void)testPadding
{
    UIView *one = [[UIView alloc] init];
    one.extSize = CGSizeMake(0.0f, 0.0f);
    
    CGFloat total = [EasyLayout totalWidthForViews:@[one,one] padding:10.0f];
    XCTAssertEqual(total, 10.0f, @"incorrect width: %1.2f", total);
}

@end
