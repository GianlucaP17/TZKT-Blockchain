//
//  PostDetailRemoteDataSourceInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation
public protocol PostDetailRemoteDataSourceInterface {
    
    init(urlString: String, coder: JSONDecoder)
    
    func getPosts() async throws -> [DetailModel]
}
