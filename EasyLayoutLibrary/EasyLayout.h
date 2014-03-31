//
//  EasyLayout.h
//
//  Created by Ben Ford on 1/22/13.
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

#import <UIKit/UIKit.h>
#import "QuickFrame.h"

#define cgs0 CGSizeZero
#define cgs(width, height) CGSizeMake(width, height)

#define cgp0 CGPointZero
#define cgp(x, y) CGPointMake(x, y)

#define cgr0 CGRectZero
#define cgr(x, y, width, height) CGRectMake(x, y, width, height)
#define cgrs(width, height) CGRectMake(0.0f, 0.0f, width, height)

@interface UIView(EasyLayoutMethods)
@property (nonatomic, assign) CGPoint extOrigin;
@property (nonatomic, assign) CGSize extSize;
@property (nonatomic, readonly) CGPoint extTerminus;
@property (nonatomic, readonly) CGPoint extMedial;
@property (nonatomic, readonly) CGSize extHalfSize;

@property (nonatomic, readonly) QuickFrame *extQuickFrame;

@property (nonatomic, assign) CGFloat extWidth;
@property (nonatomic, assign) CGFloat extHeight;
@property (nonatomic, assign) CGFloat extX;
@property (nonatomic, assign) CGFloat extY;

@property (nonatomic, readonly) NSString *extBoundsString;
@property (nonatomic, readonly) NSString *extFrameString;
@property (nonatomic, readonly) NSString *extTransformString;

- (void)extRemoveAllSubviews;
- (void)extAddSubviews:(NSArray *)subviews;
- (void)extRemoveSubviews:(NSArray *)subviews;
@end

@interface EasyLayout : NSObject

+ (void)topCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)topCenterViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)bottomCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomCenterViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)centerView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)centerViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;
+ (void)centerVerticalViews:(NSArray *)targetViews inParentView:(UIView *)parentView
                     offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)distributeHorizontallyViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)distributeVerticallyViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset;

/**
 If firstView or secondView is nil the top of the screen or bottom of the screen will be used, respectively.
 */
+ (void)centerView:(UIView *)targetView inParentView:(UIView *)parentView
        inbetweenVerticallyFirstView:(UIView *)firstView secondView:(UIView *)secondView offset:(CGSize)offset;

+ (void)rightCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)leftCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomLeftView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)topRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView toLeftOfView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView toLeftAndVerticalCenterOfView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView toRightAndVerticalCenterOfView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView toRightOfView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView atViewCenter:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView atView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionViews:(NSArray *)targetViews belowViews:(NSArray *)siblingViews offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowViews:(NSArray *)siblingViews offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterWithView:(UIView *)centerInView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset;

+ (void)positionViews:(NSArray *)targetViews belowView:(UIView *)siblingView
        horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView horizontallyCenterWithView:(UIView *)centerInView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView aboveView:(UIView *)siblingView horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView verticalCenterOfView:(UIView *)siblingVIew offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView centerOfView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)modifyHeight:(UIView *)targetView toBottomOfView:(UIView *)siblingView offset:(CGFloat)offset;
+ (void)modifyHeight:(UIView *)targetView toTopOfView:(UIView *)siblingView offset:(CGFloat)offset;

+ (void)modifyHeight:(UIView *)targetView toBottomOfParent:(UIView *)parentView offset:(CGFloat)offset;
+ (void)modifyWidth:(UIView *)targetView toRightOfParent:(UIView *)parentView offset:(CGFloat)offset;

+ (void)positionView:(UIView *)targetView inbetweenHorizontallyFirstView:(UIView *)firstView secondView:(UIView *)secondView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView inbetweenVerticallyFirstView:(UIView *)firstView secondView:(UIView *)secondView offset:(CGSize)offset;

+ (void)sizeView:(UIView *)targetView toParent:(UIView *)parentView edgeInsets:(UIEdgeInsets)edgeInsets;
+ (void)sizeView:(UIView *)targetView toParent:(UIView *)parentView insetSize:(CGSize)insetSize;

+ (void)sizeButton:(UIButton *)button matchHeightOfView:(UIView *)view;
@end

@interface EasyLayout(Inspection)
+ (UIView *)lowestViewFromArray:(NSArray *)arrayOfViews ignoreZeroHeight:(BOOL)ignoreZeroHeight;
+ (CGFloat)totalWidthForViews:(NSArray *)views padding:(CGFloat)padding;
+ (CGFloat)totalHeightForViews:(NSArray *)views padding:(CGFloat)padding;
@end

typedef enum
{
    ELLineModeSingle = 0,
    ELLineModeMulti,
} ELLineMode;

@interface EasyLayout(TextField)
+ (void)sizeTextFieldHeight:(UITextField *)textField offset:(CGFloat)offset;
@end

@interface EasyLayout(Label)
+ (void)sizeLabel:(UILabel *)label mode:(ELLineMode)lineMode maxWidth:(CGFloat)maxWidth;
@end

@interface EasyLayout(Button)
+ (void)sizeButton:(UIButton *)button mode:(ELLineMode)lineMode maxWidth:(CGFloat)maxWidth;
+ (void)modifyButton:(UIButton *)button addPaddingWithoutOriginChange:(CGFloat)padding;
@end