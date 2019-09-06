//
//  BaseTableView.swift
//  NestScrollViewDemo
//
//  Created by leeyii on 2019/9/5.
//  Copyright © 2019 leeyii. All rights reserved.
//

import UIKit

class BaseTableView: UITableView, UIGestureRecognizerDelegate {
    
    var panGestrueShouldBegain = true

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer == panGestureRecognizer {
//            return panGestrueShouldBegain
//        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
}
