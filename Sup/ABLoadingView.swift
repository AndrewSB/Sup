//
//  ABLoadingView.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/21/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class ABLoadingView: UIView {
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    let loadingLabel = UILabel(frame: CGRectZero)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let viewsInset = 4
        
        let partialStartX = Float(CGRectGetMaxX(bounds) - CGRectGetWidth(loadingLabel.frame) - CGRectGetWidth(activityIndicator.frame))
        let startX = floorf((partialStartX - Float(4)) / 2.0);
        
        
        let activityIndicatorFrameCenter = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
        let aIX = (Float(center.x) - Float(activityIndicator.frame.size.width)) / 2
        let aIY = Float(center.y) - Float(activityIndicator.frame.size.height) / 2
        let activityIndicatorFrameOrigin = CGPointMake(CGFloat(floorf(aIX)), CGFloat(floorf(aIY)))

        
        var activityIndicatorFrame = CGRectMake(activityIndicatorFrameOrigin.x, activityIndicatorFrameOrigin.y, activityIndicator.frame.size.width, activityIndicator.frame.size.height)
        activityIndicatorFrame.origin.x = CGFloat(startX)
        activityIndicator.frame = activityIndicatorFrame
    }
    
}
