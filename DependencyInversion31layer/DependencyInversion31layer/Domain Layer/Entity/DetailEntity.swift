//
//  DetailEntity.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

///Entity: a model contains data for the interactor. Data model that suits the business logic.
public struct DetailEntity: Identifiable {
    
    public var id: UUID = UUID()
    public let sender: Sender?
    public let target: Target?
    public let amount: Int?
    public let status: String?
    
    public init(sender: Sender?, target: Target?, amount: Int?, status: String?) {
        self.sender = sender
        self.target = target
        self.amount = amount
        self.status = status
    }
}
