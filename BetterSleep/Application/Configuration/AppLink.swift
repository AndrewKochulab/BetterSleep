//
//  AppLink.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol AppLinkRepresentable {
    
    // MARK: - Properties
    
    var name: String { get }
    var url: URL { get }
    
}

enum AppLink: AppLinkRepresentable {
    
    // MARK: - Cases
    
    case termsAndConditions
    case privacyPolicy
    
    
    // MARK: - Properties
    
    var name: String {
        switch self {
            case .termsAndConditions:
                return "Terms & Conditions"
            
            case .privacyPolicy:
                return "Privacy Policy"
        }
    }
    
    private var path: String {
        switch self {
            case .termsAndConditions:
                return "https://google.com"
                
            case .privacyPolicy:
                return "https://google.com"
        }
    }
    
    var url: URL {
        return URL(string: path)!
    }
}
