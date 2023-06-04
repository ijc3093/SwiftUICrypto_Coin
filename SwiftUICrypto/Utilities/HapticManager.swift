//
//  HapticManager.swift
//  SwiftUICrypto
//
//  Created by Ike Chukz on 5/31/23.
//

import Foundation
import SwiftUI


class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
