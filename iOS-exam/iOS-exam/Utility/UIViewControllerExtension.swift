//
//  UIViewControllerExtension.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import UIKit

extension UIViewController{
    func showErrorMessage(message: String? = ErrorMessage.unknown.rawValue){
        let alertView = UIAlertController(title: "Oops!",
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }

}
