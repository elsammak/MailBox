//
//  APIClient.swift
//  MailBoxKit
//
//  Created by Mohammed Elsammak on 4/3/17.
//  Copyright © 2017 SoftXPert. All rights reserved.
//
/// APIClient class is the endpont where all connection to the server occuers, it also responsible for all configurations of connections/caching/..etc.
/// This class will have different extesnions fo all DataServices classes.
import Foundation
import Alamofire
class APIClient {
    
    let core: MailBoxCore
    let config: Config
    let baseUrl: String
    let manager: Alamofire.SessionManager
    
    // MARK: - Inits
    init(core: MailBoxCore) {
        self.core = core
        self.config = core.config
        self.baseUrl = "\(config.baseUrl)"
        self.manager = Alamofire.SessionManager.default
    }
    
    // MARK: - Send requests
    /**
     Send GET request to server.
     
     - Parameter url:  Endpoint url.
     - Parameter params: GET parameters.
     - Parameter headers: URLRequest headres.
     
     - Returns: Request object, this is discardable result so it could be neglected, may be used to cancel ongoing requests.
     */
    @discardableResult internal func getJson(_ url: String, params: [String: String]? = nil, headers: [String: String]? = nil, completion: @escaping (AnyObject?, Error?) -> Void) -> Request {
        
        return sendRequest(toUrl: url, usingMethod: .get, withParams: params, withHeaders: headers, completion: completion)
    }
    
    /**
     Send POST request to server.
     
     - Parameter url:  Endpoint url.
     - Parameter params: POST parameters.
     - Parameter headers: URLRequest headres.
     
     - Returns: Request object, this is discardable result so it could be neglected, may be used to cancel ongoing requests.
     */
    @discardableResult internal func postJson(_ url: String, params: [String: String]? = nil, headers: [String: String]? = nil, completion: @escaping (AnyObject?, Error?) -> Void) -> Request {
        
        return sendRequest(toUrl: url, usingMethod: .post, withParams: params, withHeaders: headers, completion: completion)
    }
    /**
     Send request to the server.
     
     - Parameter url:  Endpoint url.
     - Parameter method:  HTTP method (GET/POST/...).
     - Parameter params: GET parameters.
     - Parameter headers: URLRequest headres.
     
     - Returns: Request object, this is discardable result so it could be neglected, may be used to cancel ongoing requests.
     */
    @discardableResult private func sendRequest(toUrl url: String,
                                                usingMethod method: HTTPMethod,
                                                withParams params: [String: String]? = nil,
                                                withHeaders headers: [String: String]? = nil,
                                                completion: @escaping (AnyObject?, Error?) -> Void) -> Request {
        
        return manager.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).validate().responseJSON { response in
            
            guard response.result.isSuccess else {
                var responseError: Error? = nil
                if case let .failure(error) = response.result {
                    responseError = error
                }
                
                return completion(nil, responseError)
            }
            if let data = response.result.value {
                
                return completion(data as AnyObject?, nil)
                
            }
            
        }
    }
}
