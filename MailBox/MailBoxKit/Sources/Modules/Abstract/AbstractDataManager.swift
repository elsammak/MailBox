//
//  AbstractDataManager.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
open class AbstractDataManager {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
        
}
