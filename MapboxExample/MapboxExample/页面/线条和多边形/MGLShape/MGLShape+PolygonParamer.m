//
//  MGLShape+PolygonParamer.m
//  Etoury
//
//  Created by dev on 2018/1/3.
//  Copyright © 2018年 iron. All rights reserved.
//

#import "MGLShape+PolygonParamer.h"
#import <objc/runtime.h>


static UIColor *_fillColor;//填充颜色
static NSInteger _fillOpacity;//填充透明度
static UIColor *_strokeColor;//描边颜色
static BOOL _isDash;//YES = 虚线／NO = 实线
static NSInteger _strokeWeight;//描边宽度



@implementation MGLShape (PolygonParamer)


- (void)setFillColor:(UIColor *)fillColor {
    objc_setAssociatedObject(self, &_fillColor, fillColor, OBJC_ASSOCIATION_COPY);
}
- (UIColor *)fillColor {
    return objc_getAssociatedObject(self, &_fillColor);
}


- (void)setFillOpacity:(CGFloat)fillOpacity {
    NSNumber *fillOpacityNumber = @(fillOpacity);
    objc_setAssociatedObject(self, &_fillOpacity, fillOpacityNumber, OBJC_ASSOCIATION_COPY);
}
- (CGFloat)fillOpacity {
    NSNumber *fillOpacityNumber = objc_getAssociatedObject(self, &_fillOpacity);
    return [fillOpacityNumber floatValue];
}


- (void)setStrokeColor:(UIColor *)strokeColor {
    objc_setAssociatedObject(self, &_strokeColor, strokeColor, OBJC_ASSOCIATION_COPY);
}
- (UIColor *)strokeColor {
    return objc_getAssociatedObject(self, &_strokeColor);
}


- (void)setIsDash:(BOOL)isDash {
    NSNumber *isDashNumber = [NSNumber numberWithBool:isDash];
    objc_setAssociatedObject(self, &_isDash, isDashNumber, OBJC_ASSOCIATION_COPY);
}
- (BOOL)isDash {
    NSNumber *isDashNumber = objc_getAssociatedObject(self, &_isDash);
    return [isDashNumber boolValue];
}


- (void)setStrokeWeight:(NSInteger)strokeWeight {
    NSNumber *strokeWeightNumber = @(strokeWeight);
    objc_setAssociatedObject(self, &_strokeWeight, strokeWeightNumber, OBJC_ASSOCIATION_COPY);
}
- (NSInteger)strokeWeight {
    NSNumber *strokeWeightNumber = objc_getAssociatedObject(self, &_strokeWeight);
    return [strokeWeightNumber integerValue];
}




@end
