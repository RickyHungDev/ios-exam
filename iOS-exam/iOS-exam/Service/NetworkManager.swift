//
//  NetworkManager.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import Foundation

class NetworkManager {
    
    class func getData(with url: URL, completionHandler: @escaping (Data? ,String?) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil, ErrorMessage.getData.rawValue)
                return
            }
            
            if let data = data {
                completionHandler(data, nil)
            } else {
                completionHandler(nil, ErrorMessage.noDataResponse.rawValue)
            }
        }
        
        task.resume()
    }
    
}
