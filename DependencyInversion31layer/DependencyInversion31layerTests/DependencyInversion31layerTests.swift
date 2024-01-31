//
//  DependencyInversion31layerTests.swift
//  DependencyInversion31layerTests
//
//  Created by Gianluca Posca on 31/01/24.
//

import XCTest
@testable import DependencyInversion31layer

final class DependencyInversion31layerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Test Sync code
    func test_PostDetailVM_loadPost_bodyTest() throws {
        //given
        let di = PostDetailsDI(appEnvironment: AppEnvironment())
        
        //when
        let vm = di.postDetailsDependencies(post: PostEntity(level: 123, proposer: nil, timestamp: "4321:312:4321", numberOfTransactions: 12))
        
        //then
        XCTAssert(vm.post.level == 123)
    }
    
    //Test async code
    func test_Async_PostVM_loadPosts_nonNil() async throws {
        
        // Data Layer
        let baseURL = AppEnvironment().baseURL + "/v1/blocks"
        let blockCountURL = AppEnvironment().baseURL + "/v1/operations/transactions/count?level="
        
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
        
        //when
        let expectation = XCTestExpectation(description: "Posts loaded successfully")
        let posts = try await postVM.getPosts()
        if !posts.isEmpty {
            expectation.fulfill()
        }
        
        //then
        wait(for: [expectation], timeout: 10)
    }

    /// > XCUITest
}
