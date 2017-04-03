//
//  AbstractViewModel.swift
//  MailBox
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//

import Foundation
protocol ViewModelUpdateMethods {
    func update()
}
class AbstractViewModel: ViewModelUpdateMethods {
    
    var willUpdateData: ((AbstractViewModel) -> Void)?
    var didUpdateData: ((AbstractViewModel) -> Void)?
    
    func update() {
        // Do any requiremnt before ask for update from server for all viewModels
    }
}
