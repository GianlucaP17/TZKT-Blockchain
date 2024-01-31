//
//  DetailInteractor.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

public class DetailInteractor: DetailInteractorInterface {
    let detailDomainRepo: DetailDomainRepointerface
    
    ///PostInteractor uses an injected postDomainRepo object which conforms to PostDomainRepoInterface to get data.
    public init(detailDomainRepo: DetailDomainRepointerface) {
        self.detailDomainRepo = detailDomainRepo
    }
    
    ///interactor/UseCase
    ///getPosts() method doesn’t contain actual business logic, just calling another method for the sake of simplicity. But this is where you apply your business logic. For example you can check if a post contains racist words to ban the post — or feature it if you are racist. Or you can check if you have added any of these posts to your favorites and apply a star to it.
    public func getPosts() async throws -> [DetailEntity] {
        let postDomainModelArray = try await detailDomainRepo.getPosts()
        return postDomainModelArray
    }

    
    /// > DataRepo
}
