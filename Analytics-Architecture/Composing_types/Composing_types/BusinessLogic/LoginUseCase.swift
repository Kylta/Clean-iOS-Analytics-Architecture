//
//  LoginUseCase.swift
//  Composing_types
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed()
}

class LoginUseCase {
    let output: LoginUseCaseOutput

    init(output: LoginUseCaseOutput) {
        self.output = output
    }
}
