//
//  UIApplication.swift
//  MyCrypto
//
//  Created by Admin on 31.08.2023.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
