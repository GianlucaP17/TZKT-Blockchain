//
//  PostDetailsDI.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

class PostDetailsDI {
    let appEnvironment: AppEnvironment
    
    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    ///as wrote before, we need to add 9 file to make a new feature, but this depends... i can have even one dependency.
    func postDetailsDependencies(post: PostEntity) -> PostDetailsVM {
        
        // Data Layer
        let baseURL = appEnvironment.baseURL + "/v1/operations/transactions?level=" + "\(post.level ?? 0)"
        
        // Data Source
        let postDetailRemoteDataSource = PostDetailRemoteDataSource(urlString: baseURL)
        
        // Data Repo
        let postDataRepo = DetailDataRepo(postRemoteDataSource: postDetailRemoteDataSource)
        
        // Domain Layer
        let postInteractor = DetailInteractor(detailDomainRepo: postDataRepo)
        
        // Presentation
        let postDetailsVM = PostDetailsVM(postInteractor: postInteractor, post: post)
        /// > PostDetailsView
        return postDetailsVM
    }
    
    /// > PostView
}
