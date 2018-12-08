//
//  LoginUseCaseFactoryTest.swift
//  Composing_typesTests
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import Composing_types

class LoginUseCaseFactoryTest: XCTestCase {

    func test_createdUseCase_hasComposedOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        let composer = useCase.output as? LoginUseCaseOutputComposer

        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseAnalyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T }.count
    }
}


