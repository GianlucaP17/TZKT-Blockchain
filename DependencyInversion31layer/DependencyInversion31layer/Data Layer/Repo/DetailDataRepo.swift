//
//  DetaildataRepo.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation
///DataRepo that implements this abstraction, so that data and domain are loosely coupled.
///here we have a list or Data source we can access to, so the external ccan call getPost and we decide what DataSource to use.
public class DetailDataRepo: DetailDomainRepointerface {
    
    ///we get every DataSource we have
    let postRemoteDataSource: PostDetailRemoteDataSource
    let coder: JSONDecoder
    
    public init(postRemoteDataSource: PostDetailRemoteDataSource,
                coder: JSONDecoder = JSONDecoder()) {
        
        self.postRemoteDataSource = postRemoteDataSource
        self.coder = coder
    }
    
    ///create a method to get the desired data.
    public func getPosts() async throws -> [DetailEntity] {
        let postModels = try await postRemoteDataSource.getPosts()
        return postModels.map({DetailEntity(sender: $0.sender, target: $0.target, amount: $0.amount, status: $0.status)})
    }
    
    
    /// > PostRemoteDataSource
}
