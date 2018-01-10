//
//  CodeViewController.swift
//  ScrollView+Autolayout
//
//  Created by 杨冬青 on 2018/1/10.
//  Copyright © 2018年 杨冬青. All rights reserved.
//

import UIKit
import SnapKit

final class CodeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let height = 150
    
    let scrollView = UIScrollView()
    scrollView.bounces = false
    scrollView.backgroundColor = .red
    // scroll top space
    if #available(iOS 11.0, *) {
      scrollView.contentInsetAdjustmentBehavior = .never
    } else {
      automaticallyAdjustsScrollViewInsets = false
    }
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { (make) in
      make.left.right.equalTo(view)
      make.centerY.equalTo(view.snp.centerY)
      make.height.equalTo(height)
    }
    
    let container = UIView()
    container.backgroundColor = .yellow
    scrollView.addSubview(container)
    // 容器设置四边和scrollview间距为0
    // 容器设置高度和scrollview一致，
    // 高度未知
    container.snp.makeConstraints { (make) in
      make.edges.equalTo(scrollView)
      make.height.equalTo(height)
    }
    
    let boxWidth = 100
    let boxMargin = 10.0
    let boxCount = 10
    for i in 0...boxCount {
      let box = UIView()
      box.backgroundColor = .green
      container.addSubview(box)
      box.snp.makeConstraints({ (make) in
        make.top.height.equalTo(container)
        make.width.equalTo(boxWidth)
        if i == 0 {
          // *设置容器的左边
          make.left.equalTo(container).offset(boxMargin * 0.5)
        } else {
          let previousBox = container.subviews[i - 1]
          make.left.equalTo(previousBox.snp.right).offset(boxMargin)
        }
        if i == boxCount {
          // *设置容器的右边，即容器的宽度可知
          container.snp.makeConstraints({ (make) in
            make.right.equalTo(box.snp.right).offset(boxMargin * 0.5)
          })
        }
      })
    }
  }
}
