//
//  LoginUseCaseComposer.swift
//  Composing_typesTests
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import Composing_types

class LoginUseCaseOutputComposerTest: XCTestCase {

    func test_composingZeroOutpouts_doesNotCrash() {
        let sut = LoginUseCaseOutputComposer([])
        sut.loginSucceeded()
        sut.loginFailed()
    }

    func test_composingOneOutputs_delegatesSucceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1])

        sut.loginSucceeded()

        XCTAssertEqual(output1.loginSucceededCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)
    }

    func test_composingOneOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1])

        sut.loginFailed()

        XCTAssertEqual(output1.loginSucceededCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)
    }

    func test_composingMultipleOutputs_delegatesSucceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])

        sut.loginSucceeded()

        XCTAssertEqual(output1.loginSucceededCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)

        XCTAssertEqual(output2.loginSucceededCallCount, 1)
        XCTAssertEqual(output2.loginFailedCallCount, 0)
    }

    func test_composingMultipleOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])

        sut.loginFailed()

        XCTAssertEqual(output1.loginSucceededCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)

        XCTAssertEqual(output2.loginSucceededCallCount, 0)
        XCTAssertEqual(output2.loginFailedCallCount, 1)
    }
    // MARK: - Helpers

    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSucceededCallCount = 0
        var loginFailedCallCount = 0

        func loginSucceeded() {
            loginSucceededCallCount += 1
        }

        func loginFailed() {
            loginFailedCallCount += 1
        }


    }
}
