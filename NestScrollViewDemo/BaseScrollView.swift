//
//  BaseScrollView.swift
//  NestScrollViewDemo
//
//  Created by leeyii on 2019/9/5.
//  Copyright © 2019 leeyii. All rights reserved.
//

import UIKit

class BaseScrollView: UIScrollView , UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
