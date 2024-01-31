//
//  PostView.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation
import SwiftUI
///PostView: represents a screen, contains UI components and navigation, shouldn’t contain any sort of logic
public struct PostView: View {
    
    var appDI: AppDIInterface
    @ObservedObject public var postVM: PostVM
    
    public init(appDI: AppDIInterface, postVM: PostVM) {
        self.appDI = appDI
        self.postVM = postVM
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("This is a demostration of how i usually build up my apps, loading data form an endPoint, decoding a JSON, shows data on a table.\nStarting with the architecture, a 3+1 layer, with Dependency Inversion, following the SOLID principles, managing error and separating each layer with the ability to make UITest and XCTest.")
                        .font(.system(size: 13))
                        .padding()
                    List {
                        ForEach(postVM.posts) { post in
                            NavigationLink(
                                destination: PostDetailsView(postDetailsVM: appDI.postDetailsDependencies(post: post)),
                                ///> postDetailsDependencies
                                label: {
                                    VStack(alignment: .leading) {
                                        Text("Level: \(post.level ?? 0)")
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                        
                                        Text("Proposer \nAlias: \(post.proposer?.alias ?? "-") \nAddress: \(post.proposer?.address ?? "-")")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        
                                        Text("Time: \(post.timestamp ?? "-")")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        
                                        Text("Transaction count: \(post.numberOfTransactions ?? 0)")
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                    }
                                })
                        }
                    }
                }
                ScreenAlert(text: postVM.showError?.localizedDescription ?? "Error loading data",
                            show: postVM.showError != nil)
            }
            .navigationBarTitle("Posts")
        }
        .onAppear {
            ///calling the method from its VM will get as the data to shows
            Task {
                try await self.postVM.getPosts()
            }
            ///> PostVM
        }
    }
    
    /// > Detail
}
