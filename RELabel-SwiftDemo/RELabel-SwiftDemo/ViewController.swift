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
        
        
        label.matchTextColor = UIColor.red
        
        
        label.linkTapHandler = { (label , link , range)in
            
            print(link)
        }

    }

}


// MARK: - 事件监听

extension ViewController{
    
    
    
    
}

