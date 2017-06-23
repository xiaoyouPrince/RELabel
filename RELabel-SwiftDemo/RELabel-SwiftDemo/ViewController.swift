//
//  ViewController.swift
//  RELabel-SwiftDemo
//
//  Created by 渠晓友 on 2017/6/15.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var label: RELabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
// MARK: - 基本使用设置
        
        /// 设置匹配完成后的文字颜色（可选）
        //  label.matchTextColor = UIColor.red
        
        
        /// 匹配类型（可选） -- 默认 用户、连接、话题
        /**
         NoneTapHandler = 0   取消所有默认匹配
         UserTapHandler
         TopicTapHandler
         LinkTapHandler
         */
        label.matchTypes = [.UserTapHandler, .LinkTapHandler]
        
        
        /// 设置自定义匹配内容（可选。实际是自定义匹配正则表达式） 此属性和上面不可公用！
        label.customMatchString = "\\d\\d"
        
  
        
        
        
// MARK: - 用户点击的监听----
//        listenAllClick()
    }

}



extension ViewController{
    
    /// 监听所有的点击事件
    fileprivate func listenAllClick(){
        
        
        /// 监听连接点击
        label.linkTapHandler = { (label , link , range) in
            
            print(label)
            print(link)
            print((NSStringFromRange(range)))
        }
        
        
        /// 监听用户点击
        label.userTapHandler = { (label , user , range) in
            
            print(label)
            print(user)
            print((NSStringFromRange(range)))
        }
        
        
        /// 监听话题点击
        label.topicTapHandler = { (label , topic , range) in
            
            print(label)
            print(topic)
            print((NSStringFromRange(range)))
        }
        
        
        /// 监听用户自定义String点击
        label.customTapHandler = { (label , customStr , range) in
            
            print(label)
            print(customStr)
            print((NSStringFromRange(range)))
        }

    }
}

