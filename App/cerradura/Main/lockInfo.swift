//
//  lockInfo.swift
//  cerradura
//
//  Created by Camilo Zambrano on 9/02/22.
//

import SwiftUI




struct lockInfo: View {
    @ObservedObject var model = data()
    var info: dataStructure
    var isUnlocked = false
    
    
    
    var body: some View {
        VStack{
            Image(systemName: "lock.fill").resizable().frame(width: 150, height: 150).padding().shadow(color: Color.green, radius: 10).padding()
            Text(info.name).font(.title).padding()
            Text("id: " + String(info.id)).font(.body).padding()
            Button {
                model.authenticate()
                if model.isUnlocked{
                    model.addData(id: info.id)
                }
            } label: {
                Text("Desbloquear").font(.title)
            }
            .padding(.vertical, 20.0)
            Text("Usuarios").font(.title).padding(.top, 20.0)
            List(info.users, id: \.self){user in
                Text(user)
            }
            Spacer()

        }
    }
}

struct lockInfo_Previews: PreviewProvider {
    static var previews: some View {
        lockInfo(info: dataStructure(id:"test", name: "Casa", users: ["test@test.com", "test@test.test"]))
    }
}
