//
//  ProtocolSendMessage.swift
//  Assignment4
//
//  Created by user214742 on 2/20/22.
//

import Foundation

protocol SendMessageDelegate {
    func sendMessage(message : String)
}


protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText : String)
}
