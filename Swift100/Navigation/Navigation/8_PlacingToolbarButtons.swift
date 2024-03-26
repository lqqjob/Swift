//
//  PlacingToolbarButtons.swift
//  Navigation
//
//  Created by liqiang on 2024/3/26.
//

import SwiftUI

struct PlacingToolbarButtons: View {
    var body: some View {
        NavigationStack {
            Text("Hello,world")
                .toolbar {
                    /**
                     虽然这很有效，但通常最好使用语义选项之一——具有特定意义的放置，而不是仅仅依赖其位置。这些包括：

                     .confirmationAction，当您希望用户同意某些内容时，例如同意服务条款。
                     .destructiveAction，当用户需要选择销毁他们正在处理的任何内容时，例如确认他们想要删除他们创建的一些数据。
                     .cancellationAction，当用户需要退出他们所做的更改时，例如丢弃他们所做的更改。
                     .navigation，用于使用户在数据之间移动的按钮，例如在网络浏览器中来回移动。
                     */
                    ToolbarItem(placement:.topBarLeading) {
                        Button("Tap me") {
                            
                        }  
                    }
                    ToolbarItem(placement:.topBarLeading) {
                        Button("Or Tap me") {
                            
                        }
                    }
                    
                    ToolbarItemGroup(placement: .topBarLeading, content: {
                        Button("Tap me 1") {
                            
                        }
                        Button("Tap me 1") {
                            
                        }
                    })
                }
        }
    }
}

#Preview {
    PlacingToolbarButtons()
}
