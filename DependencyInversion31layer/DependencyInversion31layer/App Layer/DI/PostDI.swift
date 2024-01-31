//
//  PostDI.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

class PostDI {
    
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    ///every feature has its own dependency to rely on divided in 3 layers.
    func postDependencies() -> PostVM {
        
        // Data Layer
        let baseURL = appEnvironment.baseURL + "/v1/blocks"
        let blockCountURL = appEnvironment.baseURL + "/v1/operations/transactions/count?level="
        
        // Data Source
        let postRemoteDataSource = PostRemoteDataSource(urlString: baseURL)
        let blockCountRemoteDataSource = BlockCountRemoteDataSource(urlString: blockCountURL)
        
        // Data Repo
        let postDataRepo = PostDataRepo(postRemoteDataSource: postRemoteDataSource, 
                                        blockCountRemoteDataSource: blockCountRemoteDataSource)
        
        // Domain Layer
        let postInteractor = PostInteractor(postDomainRepo: postDataRepo)
        
        // Presentation
        let postVM = PostVM(postInteractor: postInteractor)
        
        return postVM
    }
    
    /// > PostDetailDI
}
