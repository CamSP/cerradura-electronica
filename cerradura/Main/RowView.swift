//
//  RowView.swift.swift
//  cerradura
//
//  Created by Camilo Zambrano on 9/02/22.
//

import SwiftUI

struct RowView: View {
    
    var data: dataStructure
    
    var body: some View {
        HStack{
            Image(systemName: "lock.fill").resizable().frame(width: 40, height: 40).padding()
            Text(data.name).font(.title)
            Spacer()
            
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(data: dataStructure(id:"test", name: "Casa", users: ["test@test.com"])).previewLayout(.fixed(width: 400, height: 60))
    }
}
