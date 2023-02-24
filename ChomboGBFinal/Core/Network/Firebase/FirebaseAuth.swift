//
//  FirebaseAuth.swift
//  ChomboGBFinal
//
//  Created by Ованес Захарян on 24.02.2023.
//

import FirebaseCore
import FirebaseAuth

final class FirebaseAuth {
    
    func signUpWithEmail(email: String, password : String, completion: @escaping (Bool,String)->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil{
                completion(false,(error?.localizedDescription)!)
                return
            }
            completion(true,(result?.user.email)!)
        }
    }
    
    func signInWithEmail(email: String, password : String, completion: @escaping (Bool,String)->Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                completion(false,(error?.localizedDescription)!)
                return
            }
            completion(true,(result?.user.email)!)
        }
    }
    
}
