//
//  WBDemoViewController.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //设置标题
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }
    
    //MARK - 监听方法 继续push 一个新的控制器
    @objc fileprivate func showNext() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension WBDemoViewController {
    
    //重写父类方法
    override func setupUI() {
        
        super.setupUI()
        //设置右边按钮
        //无法高亮
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个",style:.plain, target: self, action: #selector(showNext))
        
//        let btn:UIButton = UIButton.cz_textButton("下一个", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showNext), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
        
    }
    
}
