//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI


struct GridStack<Content:View>: View {

    let rows:Int
    let columns:Int
   @ViewBuilder let content:(Int,Int) -> Content //为了获得更大的灵活性，我们可以利用SwiftUI用于其视图的body属性的相同@ViewBuilder属性。将GridStackcontent属性修改为：@ViewBuilder
    
    var body: some View {
        VStack {
            ForEach(0..<rows,id:\.self) { row in
                HStack {
                    ForEach(0..<columns,id: \.self) { column in
                        content(row,column)
                    }
                }
                
            }
        }
    }
    
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows:4,columns: 4) { row,col in
            Text("R\(row) C\(col)")
        }
        
        GridStack(rows: 4, columns: 4) {row,col in
            HStack {
                Image(systemName: "globe")
                Text("R\(row) C\(col)")

            }
            
        }
        
        GridStack(rows: 4, columns: 4) {row,col in
                Image(systemName: "globe")
                .foregroundColor(.blue)
                Text("R\(row) C\(col)")
                .foregroundStyle(.blue)
            
        }
    }
}

#Preview {
    CustomContainers()
}
