//
//  DetailDomainRepointerface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation
///Domain Repo Interface: this interface/protocol is an abstraction of how the interactor gets data from data layer
public protocol DetailDomainRepointerface {
    func getPosts() async throws -> [DetailEntity]
}
