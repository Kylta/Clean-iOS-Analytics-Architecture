//
//  LoginUseCaseOutputComposer.swift
//  Composing_types
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]

    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }

    func loginSucceeded() {
        outputs.forEach { $0.loginSucceeded() }
    }

    func loginFailed() {
        outputs.forEach { $0.loginFailed() }
    }
}
