//
//  PostLocalDataSourceInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

///We are not doing the local data source
public protocol PostLocalDataSourceInterface {
    func getCachedPosts() async throws -> [PostEntity]
}
