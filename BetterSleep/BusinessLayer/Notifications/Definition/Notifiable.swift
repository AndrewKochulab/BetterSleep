//
//  Notifiable.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import Foundation

protocol Notifiable {
    
    // MARK: - Types
    
    typealias UserInfo = [AnyHashable : Any]
    typealias Name = Notification.Name
    
    
    // MARK: - Properties
    
    static var name: Name { get }
    
    var userInfo: UserInfo { get }
    
    
    // MARK: - Initialization
    
    init(userInfo: UserInfo)
    
    
    // MARK: - Appearance
    
    func post(object: Any?)
    
    static func observe<Notification>(
        object: Any?,
        queue: OperationQueue?,
        handler: @escaping (Notification) -> Void
    ) where Notification: Notifiable
    
    static func removeObserver(
        observer: Any,
        object: Any?
    )
    
}
