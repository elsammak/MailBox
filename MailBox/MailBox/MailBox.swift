//
//  MailBox.swift
//  MailBox
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
import MailBoxKit
class MailBox {
    static fileprivate(set) var core: MailBoxCore!
    static var dependency: DependencyFactory {
        return DependencyFactory(core: core)
    }
    
    static func initialize() {
        
        let baseUrl = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
        
        self.config(baseUrl: baseUrl)
        
    }
    
    private static func config(baseUrl: String) {
        
        let config = Config(baseUrl: baseUrl)
        
        core = MailBoxCore(config: config)
        
    }
    
}
