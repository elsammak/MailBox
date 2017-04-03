//
//  InboxViewModel.swift
//  MailBox
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
class InboxViewModel: AbstractViewModel {
 
    let mailActionDataManager = MailBox.dependency.mailActionDataManager()
    
    override func update() {
        super.update()
        // Do any requiremnt before ask for update from server for this viewModel
        
        mailActionDataManager.markItemAsRead(itemIDs: ["1"]) { (bool, error) in
            
        }
    }
}
