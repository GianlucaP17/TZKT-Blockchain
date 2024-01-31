//
//  PostDetailsView.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import SwiftUI

struct PostDetailsView: View {
    
    @ObservedObject public var postDetailsVM: PostDetailsVM
    
    public init(postDetailsVM: PostDetailsVM) {
        self.postDetailsVM = postDetailsVM
        /// > PostDetailsVM
    }
    
    public var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(postDetailsVM.posts) { post in
                        VStack(alignment: .leading) {
                            Text("Sender \nAddress: \(post.target?.address ?? "")\nAlias: \(post.target?.alias ?? "-")")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                            Text("Target \nAddress: \(post.target?.address ?? "")\nAlias: \(post.target?.alias ?? "-")")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                            Text("Amount: \(post.amount ?? 0)")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            
                            Text("Status: \(post.status ?? "-")")
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
            }
            ScreenAlert(text: postDetailsVM.showError?.localizedDescription ?? "Error loading data",
                        show: postDetailsVM.showError != nil)
            if postDetailsVM.posts.count == 0 {
                Text("No data")
            }
        }
        .navigationBarTitle("Detail Level: \(postDetailsVM.post.level ?? 0)")
        .onAppear {
            ///calling the method from its VM will get as the data to shows
            Task {
                try await self.postDetailsVM.getPosts()
            }
            ///> PostVM
        }
    }
}
