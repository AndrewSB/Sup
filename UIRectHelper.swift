//
//  UIRectExtension.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/21/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit


func ABRectMakeWithOriginSize(origin: CGPoint, size: CGSize) -> CGRect {
    return CGRectMake(origin.x, origin.y, size.width, size.height)
}

func ABRectMakeWithOrigin(origin: CGPoint) -> CGRect {
    return ABRectMakeWithOriginSize(origin, CGSizeZero)
}

func ABRectMakeWithSize(size: CGSize) -> CGRect {
    return ABRectMakeWithOriginSize(CGPointZero, size)
}

func ABRectMakeWithSizeCenteredInRect(size: CGSize, rect: CGRect) -> CGRect {
    let center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
    let origin = CGPointMake(CGFloat(floorf(Float(center.x - size.width / 2))), CGFloat(floorf(Float(center.y - size.height / 2))))
    return ABRectMakeWithOriginSize(origin, size)
}

func ABSizeMin(size1: CGSize, size2: CGSize) -> CGSize {
    var size = CGSizeZero;
    size.width = min(size1.width, size2.width)
    size.height = min(size1.height, size2.height)
    return size
}