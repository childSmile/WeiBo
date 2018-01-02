//
//  WBMainViewController.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
// 主控制器

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildControllers()
        setupComposeButton()
        
        /**
         
         使用代码控制设备的方向 好处 可以在需要横屏的时候 单独处理
         设置支持的方向之后当前的控制器以及自控制器都会遵守这个方向
         如果播放视频 通常使用 modal 展现
         
         **/
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")

        // Do any additional setup after loading the view.
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    //MARK-监听方法
    //撰写微博
    //FIXME 没有实现
    // fileprivate 保证方法私有 仅在当前对象被访问
    // @objc 允许这个函数在运行时 通过OC的消息机制被调用
    @objc fileprivate func composeStatus() {
        print("撰写微博")
        
        //测试方向旋转
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cz_random()
        let nav = UINavigationController.init(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    //MARK-私有控件
    fileprivate lazy var composeButton:UIButton = UIButton.cz_imageButton(
        "tabbar_compose_icon_add",
        backgroundImageName: "tabbar_compose_button")

}

//extension 类似于分类 在Swift中 还可以用来切分代码块 可以把相近功能的函数 放在一个extension中 便于维护
// 注意 和OC中分类一样 只能定义方法 不能定义属性

//MARK-设置界面
extension WBMainViewController {
    
    
    //设置撰写按钮
    fileprivate func setupComposeButton() {
        tabBar.addSubview(composeButton)
        
        //设置按钮位置
        //计算按钮宽度
        let count = CGFloat(childViewControllers.count)
        //为了消除tabbar的容错点 导致的问题 所以将button的缩进变小
        //向内缩进宽度见笑 按钮宽度变大 盖住容错点 防止出问题
        let w = tabBar.bounds.width / count - 1
        
        //OC中 CGRectInset 正数向内缩进 负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        //按钮监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        //<#T##@objc method#> 保证用OC的方式访问
//        composeButton.addTarget(self, action: #selector(<#T##@objc method#>), for: <#T##UIControlEvents#>)
    }
    
    //设置所有子控制器
    fileprivate func setupChildControllers() {
        
        let array = [
            ["clsName" : "WBHomeViewController" , "title" : "首页" , "imageName" : "home"],
            ["clsName" : "WBMessageViewController" , "title" : "消息" , "imageName" : "message_center"],
            ["clsName" : "UIViewController" ,],
            ["clsName" : "WBDiscoverViewController" , "title" : "发现" , "imageName" : "discover"],
            ["clsName" : "WBProfileViewController" , "title" : "我" , "imageName" : "profile"],
        ]
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    /**
     Xcode8和swift3更新后的注意事项
     private和fileprivate
     
       本来不用private也不会对程序的编译运行有任何影响，private只是为了保证代码外部可读性而准备的，而现在有了fileprivate以后，private变得更加“私有”。现在的private方法和对象，只能在大括号中访问，即便是这个类的extension中，也不能访问private。而fileprivate的作用域，则和以前的private一样，顾名思义，在这个文件中都能访问。
     */
    
    //使用字典创建一个子控制器
    //dict： [clsName title imageName]
    fileprivate func controller(dict:[String:String]) -> UIViewController {
        
        //1.取的字典内容
        
        guard let clsName = dict["clsName"] ,
            let title = dict["title"] ,
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
             return UIViewController()
        }

        //2.创建视图控制器
        //1>将 clsName 转换成 cls
        let vc = cls.init()
        
        vc.title = title
        
        //3.设置图片信息
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
  
        //4.设置tabbar 的标题字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName:UIColor.orange],
            for: .highlighted)
        //系统默认是12 修改字体大小 要设置normal的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName:UIFont.systemFont(ofSize: 12)],
            for: .normal)
        
        //实例化导航控制器的时候 会调用push方法 rootVC压栈
        let nav = WBNavigationController(rootViewController: vc)
        
        return nav
        
        
    }
    
}
