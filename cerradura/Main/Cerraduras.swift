//
//  Cerraduras.swift
//  cerradura
//
//  Created by Camilo Zambrano on 1/02/22.
//

import SwiftUI
import Firebase

struct Cerraduras: View {
    
    @ObservedObject var model = data()
    
    @State var users = [""]
    
    var body: some View {
            VStack{
                List(model.list){item in
                    NavigationLink(destination: lockInfo(info: item)){
                    RowView(data: item)
                    }
                }
                Spacer()
            }
            .navigationTitle("Mis cerraduras")
    }
    
    init(){
        model.getData()
    }
}

struct Cerraduras_Previews: PreviewProvider {
    static var previews: some View {
        Cerraduras()
    }
}
