//
//  Bundle+Extension.swift
//  Weibo
//
//  Created by beike on 17/3/28.
//  Copyright © 2017年 doman. All rights reserved.
//

import Foundation

extension Bundle {
    

    //计算型属性类似于一个函数 没有参数  有返回值
    var namespace:String {
        
       return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
