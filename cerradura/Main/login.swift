//
//  login.swift
//  cerradura
//
//  Created by Camilo Zambrano on 2/02/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    func signIn(email:String, password:String){
        auth.signIn(withEmail: email, password: password){ [weak self]
            result, error in guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email:String, password:String){
        auth.createUser(withEmail: email, password: password){[weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    
}



struct login: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                    VStack{
                        Cerraduras()
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("Log out")
                        })
                        
                        
                    }
                    Spacer()

            }else{
                SignInView()
            }
        }
        
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
        
    }
}

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            TextField("Email Addres", text:$email).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
            SecureField("Password", text:$password).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
            Button(action:{
                guard !email.isEmpty, !password.isEmpty else{
                    return
                }
                viewModel.signIn(email: email, password: password)
            }, label: {
                Text("Sign Up").foregroundColor(Color.white).frame(width: 200, height: 50).background(Color.blue).cornerRadius(8)
            })
            NavigationLink("Create Account", destination: SignUpView())
            Spacer()
            
        }.padding()
            .navigationTitle("Sign In")
    }
}

struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            TextField("Email Addres", text:$email).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
            SecureField("Password", text:$password).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
            Button(action:{
                guard !email.isEmpty, !password.isEmpty else{
                    return
                }
                viewModel.signUp(email: email, password: password)
            }, label: {
                Text("Create Account").foregroundColor(Color.white).frame(width: 200, height: 50).background(Color.blue).cornerRadius(8)
            })
            Spacer()
        }.padding()
            .navigationTitle("Create Account")
        
    }
}


struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
            .preferredColorScheme(.dark)
    }
}
