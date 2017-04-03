//
//  MailActionDataManager.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
class MailActionDataManager: AbstractDataManager {
    
    func markItemAsRead(itemIDs: [String], completion: @escaping DataServiceLayerCompletion) {
        
        apiClient.markRead(forItemsID: itemIDs) { (bool, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(bool, nil)
        }
    }
}
