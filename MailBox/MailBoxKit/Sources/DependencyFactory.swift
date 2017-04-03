//
//  DependencyFactory.swift
//  MailBoxSDK
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
open class DependencyFactory {
    
    let core: MailBoxCore
    
    required public init(core: MailBoxCore) {
        self.core = core
    }
    
    lazy var apiClient: APIClient = {
        return APIClient(core: self.core)
    }()
    
    public func mailActionDataManager() -> MailActionDataManager {
        return MailActionDataManager(apiClient: apiClient)
    }
}
