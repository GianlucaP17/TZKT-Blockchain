//
//  DetailInteractorInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

///Interactor: contains business logic for each specific feature. It is also called Use Case
public protocol DetailInteractorInterface {
    func getPosts() async throws -> [DetailEntity]
}
