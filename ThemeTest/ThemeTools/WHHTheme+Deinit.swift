//
//  WHHTheme+deinit.swift
//  ThemeTest
//
//  Created by whh on 2022/1/11.
// 释放主题切换

import Foundation

class WHThemeDeinitBlockExecutor: NSObject {

    var deinitBlock:(() -> Void)?

    /// 构造方法
    ///
    /// - Parameter deinitBlock: 接收更换主题模式的通知block
    /// - Returns: <#return value description#>
    static func executorWithDeinitBlock(_ deinitBlock:(() -> Void)?) -> WHThemeDeinitBlockExecutor {

        let deinitBlockExecutor: WHThemeDeinitBlockExecutor = WHThemeDeinitBlockExecutor()
        deinitBlockExecutor.deinitBlock = deinitBlock
        return deinitBlockExecutor

    }

    /// 执行析构方法，释放注册的通知
    deinit {
        if deinitBlock != nil {
            deinitBlock!()
            deinitBlock = nil
        }
    }

}

extension NSObject {

    /// 记录需要释放的通知主体
    func addThemeDeinitBlock(_ deinitBlock:(() -> Void)?) -> Any? {

        guard let deinitBlock = deinitBlock else { return nil }

        let deinitBlockExecutor: WHThemeDeinitBlockExecutor = WHThemeDeinitBlockExecutor.executorWithDeinitBlock(deinitBlock)

        return deinitBlockExecutor
    }

}
