//
//  PostDetailsVM.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

public class PostDetailsVM: ObservableObject {
    
    @Published var post: PostEntity
    
    @Published var posts: [DetailEntity] = []
    @Published var showError : NetworkError? = nil
    
    private var postInteractor: DetailInteractorInterface
    
    ///postInteractor is injected to the the PostVM in the init method as an abstraction, so we can mock it in unit testing.
    public init(postInteractor: DetailInteractorInterface, post: PostEntity) {
        self.postInteractor = postInteractor
        self.post = post
    }
    
    func getPosts() async throws -> [DetailEntity] {
        do {
            let postArray = try await postInteractor.getPosts()
            await MainActor.run {
                self.posts = postArray
                self.showError = nil
            }
            return postArray
        } catch {
            if let error = error as? NetworkError {
                self.showError = error
            }
            return []
        }
    }
    
    /// > XCTest
}

