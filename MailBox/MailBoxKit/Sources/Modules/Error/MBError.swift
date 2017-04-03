//
//  MBError.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
public struct ErrorMessage {
    public let type: String?
    public let message: String?
    
    public init(type: String? = nil, message: String? = nil) {
        self.type = type
        self.message = message
    }
}

public enum MBErrorType: Error {
    case unknown
    case httpError(Int, [ErrorMessage]?)
    case noInternet
    case callIsActive
    case internationalRoamingOff
    case dataNotAllowed
    case timedOutError
    case cfNetworkError(Int32, String?)
    case applicationNeedsUpdateError
    case parsingError
    case responseError(String?)
    case persistenceError(String?)
}
