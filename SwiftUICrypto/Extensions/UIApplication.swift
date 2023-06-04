//
//  UIApplication.swift
//  SwiftUICrypto
//
//  Created by Ike Chukz on 5/27/23.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
