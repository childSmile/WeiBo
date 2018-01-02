//
//  WBNavigationController.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //隐藏默认的navigationBar
        navigationBar.isHidden = true
    }
    
    @objc fileprivate func back() {
        popViewController(animated: true)
    }

    //重写 push 方法 所有的push动作 都会调用这个方法
    // viewcontroller 是被push 的控制器 设置他的左侧按钮作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        print(viewController)
        
        //如果不是栈底控制器 才需要隐藏 根控制器不需要处理
        if childViewControllers.count > 0 {
            
            //隐藏底部的tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            //判断控制器的类型
            if let vc = viewController as? WBBaseViewController {
                
                var title = "返回"
                
                //判断控制器的级数 只有一个子控制器的时候 显示栈底控制器的标题
                if childViewControllers.count == 1 {
                    //title显示首页标题
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                //取出自定义的navItem
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title,  target: self, action: #selector(back) , isBack:true)
            }
        }
        
        
        super.pushViewController(viewController, animated: true)
        
        
        
        
    }
      
}
