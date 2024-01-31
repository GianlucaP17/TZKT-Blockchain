//
//  BlockCountRemoteDataSourceInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation
public protocol BlockCountRemoteDataSourceInterface {
    
    init(urlString: String, coder: JSONDecoder)
    
    func getBlockCount(level: Int) async throws -> Int
}
