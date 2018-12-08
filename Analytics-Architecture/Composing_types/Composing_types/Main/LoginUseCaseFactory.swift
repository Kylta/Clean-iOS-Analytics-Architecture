//
//  LoginUseCaseFactory.swift
//  Composing_types
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
            LoginPresenter(),
            FirebaseAnalyticsLoginTracker(),
            CrashlyticsLoginTracker()
            ]))
    }
}
