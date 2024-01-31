//
//  PostEntity.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

///Entity: a model contains data for the interactor. Data model that suits the business logic.
public struct PostEntity: Identifiable {
    
    public var id: UUID = UUID()
    public let level: Int?
    public let proposer: Proposer?
    public let timestamp: String?
    public let numberOfTransactions: Int?
    
    public init(level: Int?, proposer: Proposer?, timestamp: String?, numberOfTransactions: Int?) {
        self.level = level
        self.proposer = proposer
        self.timestamp = timestamp
        self.numberOfTransactions = numberOfTransactions
    }
}
