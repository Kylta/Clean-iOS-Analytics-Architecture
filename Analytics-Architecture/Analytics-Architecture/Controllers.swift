//
//  Controllers.swift
//  Analytics-Architecture
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

enum AnalyticsEventEnum {
    case screenViewed
    case loginAttempted
    case loginFailed(reason: String)
    case loginSucceded
}

extension AnalyticsEventEnum: AnalyticsEvent {
    var name: String {
        switch self {
        case .loginSucceded, .loginAttempted:
            return String(describing: self)
        case .loginFailed:
            return "LoginFailed"
        case .screenViewed:
            return "ScreenViewed"
        }
    }

    var metadata: [String : Any] {
        switch self {
        case .screenViewed,
             .loginAttempted,
             .loginSucceded:
            return [:]
        case let .loginFailed(reason):
            return ["reason:": reason]
        }
    }
}

class LoginViewController {
    let analytics: AnalyticsEngine

    init(analytics: AnalyticsEngine) {
        self.analytics = analytics
    }

    private func failedLogin(reason: String) {
        analytics.log(event: AnalyticsEventEnum.loginFailed(reason: reason))
    }
}
