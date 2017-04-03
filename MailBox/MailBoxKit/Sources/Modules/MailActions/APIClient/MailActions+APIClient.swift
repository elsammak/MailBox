//
//  MailActions+APIClient.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation

private let itemsURL = "/items"

extension APIClient {


    /**
     Mark Mail as read
     
     - Parameter itemsId: Array of Ids of the mail items to mark as read.
     */
    func markRead(forItemsID itemsID: [String], completion: @escaping (Bool?, Error?) -> Void) {
        
        let param = ["items_id": itemsID.joined(separator: "','")]
        postJson("\(baseUrl + itemsURL)/read", params: param, headers: nil) { (status, error) in
            
        }
            
        
    }
}
