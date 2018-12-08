//
//  ProtocolEngineEvent.swift
//  Analytics-Architecture
//
//  Created by Christophe Bugnon on 08/12/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Foundation

protocol AnalyticsEngine {
    func log(event: AnalyticsEvent)
}

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: [String: Any] { get }
}
