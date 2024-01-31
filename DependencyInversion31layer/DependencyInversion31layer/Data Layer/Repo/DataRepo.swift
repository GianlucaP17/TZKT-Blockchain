//
//  DataRepo.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

///DataRepo that implements this abstraction, so that data and domain are loosely coupled.
///here we have a list or Data source we can access to, so the external ccan call getPost and we decide what DataSource to use.
public class PostDataRepo: PostDomainRepoInterface {
    
    ///we get every DataSource we have
    let postRemoteDataSource: PostRemoteDataSourceInterface
    let blockCountRemoteDataSource: BlockCountRemoteDataSource
    let postLocalDataSource: PostLocalDataSourceInterface?
    let coder: JSONDecoder
    
    public init(postRemoteDataSource: PostRemoteDataSourceInterface,
                blockCountRemoteDataSource: BlockCountRemoteDataSource,
                postLocalDataSource: PostLocalDataSourceInterface? = nil,
                coder: JSONDecoder = JSONDecoder()) {
        
        self.postRemoteDataSource = postRemoteDataSource
        self.blockCountRemoteDataSource = blockCountRemoteDataSource
        self.postLocalDataSource = postLocalDataSource
        
        self.coder = coder
    }
    
    ///create a method to get the desired data.
    public func getPosts() async throws -> [PostEntity] {
        let postModels = try await postRemoteDataSource.getPosts()
        var posts : [PostEntity] = []
        for postModel in postModels {
            let blockCount = try await blockCountRemoteDataSource.getBlockCount(level: postModel.level ?? 0)
            posts.append(PostEntity(level: postModel.level,
                                    proposer: postModel.proposer,
                                    timestamp: postModel.timestamp,
                                    numberOfTransactions: blockCount))
        }
        posts.sort(by: {$0.level ?? 0 > $1.level ?? 0})
        return posts
    }
    
    
    /// > PostRemoteDataSource
}
