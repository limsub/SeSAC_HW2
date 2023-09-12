//
//  LoginViewModel.swift
//  0824hw
//
//  Created by 임승섭 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var email = ""
    var password = ""
    var nickname = ""
    var location = ""
    var code = ""
    
    var isValid = Observable(false)
    
    
    func checkValidation() {
        if (email.count * password.count * nickname.count * location.count * code.count != 0) {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(_ completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
