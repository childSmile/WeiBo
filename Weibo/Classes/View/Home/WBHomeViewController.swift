//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //显示好友
    @objc fileprivate func showFriend() {
        print(#function)
        
        let vc = WBDemoViewController()
        
//        vc.hidesBottomBarWhenPushed = true
        
        //push 的动作 是 nav 做的
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension WBHomeViewController {
    //设置界面
    
    override func setupUI() {
        super.setupUI()
        
        //设置导航栏按钮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend));
        
//        let btn:UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriend), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        //抽取barButtonItem后

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriend))
        
    }
    
}
