//
//  PostRemoteDataSourceInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

public protocol PostRemoteDataSourceInterface {
    
    init(urlString: String, coder: JSONDecoder)
    
    func getPosts() async throws -> [PostModel]
}
