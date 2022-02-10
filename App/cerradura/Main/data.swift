//
//  data.swift
//  cerradura
//
//  Created by Camilo Zambrano on 2/02/22.
//

import Foundation
import Firebase
import LocalAuthentication

class data: ObservableObject{
    
    @Published var isUnlocked = false
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Por favor autentificate para abrir la cerradura."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){succes, authenticationError in
                if succes{
                    Task{
                        await MainActor.run{
                            self.isUnlocked = true
                        }
                    }
                }
            }
        }
    }
    
    @Published var list = [dataStructure]()
    
    func addData(id:String){
        let db = Firestore.firestore()
        
        db.collection("cerraduras").document(id).collection("status").document("status").setData( ["status":false]) { error in
            if error == nil {
                self.getData()
            }else{
                
            }
        }
    }
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("cerraduras").whereField("users", arrayContainsAny: [Auth.auth().currentUser?.email ?? ""]).getDocuments { snapshot, error in
            if error == nil{
                if let snapshot=snapshot{
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map{d in
                            return dataStructure(id: d.documentID, name: d["name"] as? String ?? "", users: d["users"] as? [String] ?? [""])
                        }
                    }
                }
            }else{
                
            }
        }
    }
}
