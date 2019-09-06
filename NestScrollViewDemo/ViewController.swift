//
//  ViewController.swift
//  NestScrollViewDemo
//
//  Created by leeyii on 2019/9/5.
//  Copyright © 2019 leeyii. All rights reserved.
//

import UIKit

let screenBounds = UIScreen.main.bounds
let screenW = screenBounds.width
let screenH = screenBounds.height

class ViewController: UIViewController {

   
    lazy var containerScrollView: UIScrollView = {
        let scrollView = BaseScrollView(frame: screenBounds)
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: screenW, height: screenH + 120)
        return scrollView
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: screenW, height: 120)
        return view
    }()
    
    lazy var subContainerView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenW, height: screenH))
        scrollView.contentSize = CGSize(width: screenW * 3, height: screenH)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .groupTableViewBackground
        return scrollView
    }()
    
    var contentScrollViews: [UIScrollView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(containerScrollView)
        
        containerScrollView.addSubview(headerView)
        containerScrollView.addSubview(subContainerView)
        
        configSubContainerView()
    }

    
    private func configSubContainerView() {
        
        for i in 0 ..< 3 {
            let tableView = BaseTableView(frame: CGRect(x: screenW * CGFloat(i), y: 0, width: screenW, height: screenH), style: .plain)
            tableView.backgroundColor = UIColor.random
            tableView.delegate = self
            tableView.tableFooterView = UIView()
//            tableView.contentSize = CGSize(width: 0, height: 1000)
            tableView.dataSource = self
            tableView.rowHeight = 100
            subContainerView.addSubview(tableView)
            contentScrollViews.append(tableView)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.contentView.backgroundColor = UIColor.random
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == containerScrollView {
            // 容器scrollview滑动
            let contentScrollView = self.contentScrollViews.first!
            
            if (contentScrollView.contentOffset.y > 0) {
                scrollView.contentOffset = CGPoint(x: 0, y: 120)
            }
            
        } else if scrollView == subContainerView {
            // 这里处理当横向scrollview滑动的时候,同步其他child scroll view的偏移量
        } else {
            // 内容scrollview滑动
            if self.containerScrollView.contentOffset.y < 120 - 0.5 {
                // 容器scrollview没有滑动到底部
                // 内容scrollview不可滑动
                scrollView.contentOffset = .zero
            }
        }
    }
}


extension UIColor {
    
    static var random: UIColor {
        return UIColor(red: CGFloat(Int.random(in: 0 ..< 255)) / 255.0,
                       green: CGFloat(Int.random(in: 0 ..< 255)) / 255.0,
                       blue: CGFloat(Int.random(in: 0 ..< 255)) / 255.0,
                       alpha: 1)
    }
}
