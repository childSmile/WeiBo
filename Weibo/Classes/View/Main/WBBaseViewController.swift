//
//  WBBaseViewController.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    //自定义导航条目 - 以后设置导航栏内容 统一使用这个
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cz_random()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    //重写title 的 didSet
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }


}

extension WBBaseViewController {
    
    //MARK-设置界面
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        
        //添加导航条
        view.addSubview(navigationBar)
        
        //将item设置给bar
        navigationBar.items = [navItem]
        
        //设置navBar 的渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xf6f6f6)
        
        //设置navBar的字体渲染颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        
    }
}
