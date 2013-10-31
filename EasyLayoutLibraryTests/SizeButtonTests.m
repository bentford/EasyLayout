//
//  SizeButtonTests.m
//  EasyLayoutLibrary
//
//  Created by Ben Ford on 10/31/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

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
