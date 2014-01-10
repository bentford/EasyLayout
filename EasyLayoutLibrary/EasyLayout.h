//
//  EasyLayout.h
//
//  Created by Ben Ford on 1/22/13.
//  Copyright (c) 2013 Ben Ford
//

#import <UIKit/UIKit.h>
#import "QuickFrame.h"


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

- (void)extRemoveAllSubviews;
@end

@interface EasyLayout : NSObject

+ (void)topCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)topCenterViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)bottomCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomCenterViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)centerView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)centerViews:(NSArray *)targetViews inParentView:(UIView *)parentView offset:(CGSize)offset padding:(CGFloat)padding;

+ (void)rightCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)leftCenterView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)bottomLeftView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;
+ (void)topRightView:(UIView *)targetView inParentView:(UIView *)parentView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView toLeftOfView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView toRightAndVerticalCenterOfView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView toRightOfView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView atViewCenter:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView atView:(UIView *)siblingView offset:(CGSize)offset;

+ (void)positionViews:(NSArray *)targetViews belowViews:(NSArray *)siblingViews offset:(CGSize)offset;

+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowViews:(NSArray *)siblingViews offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterWithView:(UIView *)centerInView offset:(CGSize)offset;
+ (void)positionView:(UIView *)targetView belowView:(UIView *)siblingView horizontallyCenterInParent:(UIView *)centerInParent offset:(CGSize)offset;

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


+ (void)sizeButton:(UIButton *)button matchHeightOfView:(UIView *)view;
@end

@interface EasyLayout(Inspection)
+ (UIView *)lowestViewFromArray:(NSArray *)arrayOfViews ignoreZeroHeight:(BOOL)ignoreZeroHeight;
+ (CGFloat)totalWidthForViews:(NSArray *)views padding:(CGFloat)padding;
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
@end