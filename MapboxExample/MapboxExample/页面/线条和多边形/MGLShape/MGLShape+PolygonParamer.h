//
//  MGLShape+PolygonParamer.h
//  Etoury
//
//  Created by dev on 2018/1/3.
//  Copyright © 2018年 iron. All rights reserved.
//

#import <Mapbox/Mapbox.h>

@interface MGLShape (PolygonParamer)



@property (nonatomic, strong) UIColor *fillColor;//填充颜色
@property (nonatomic, assign) CGFloat fillOpacity;//填充透明度
@property (nonatomic, strong) UIColor *strokeColor;//描边颜色
@property (nonatomic, assign) BOOL isDash;//YES = 虚线／NO = 实线
@property (nonatomic, assign) NSInteger strokeWeight;//描边宽度




@end
