//
//  LoginViewModel.swift
//  0912hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var id = "" //Observable("")
    var pw = "" //Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.count >= 6 && pw.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(_ completionHandler: @escaping () -> Void ) {
        // 아이디 저장
        UserDefaults.standard.set(id, forKey: "id")
        
        // UI 관련 작업 (Alert, 화면 전환, ...)
        completionHandler()
    }
    
    
}


class LoginViewModel2 {
    
    var id = Observable("")
    var pw = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(_ completionHandler: @escaping () -> Void ) {
        // 아이디 저장
        UserDefaults.standard.set(id.value, forKey: "id")
        
        // UI 관련 작업 (Alert, 화면 전환, ...)
        completionHandler()
    }
    
    
}
