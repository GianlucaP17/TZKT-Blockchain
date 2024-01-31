//
//  AppDIInterface.swift
//  DependencyInversion31layer
//
//  Created by Gianluca Posca on 31/01/24.
//

import Foundation

public protocol AppDIInterface {
    func postDependencies() -> PostVM
    func postDetailsDependencies(post: PostEntity) -> PostDetailsVM
}
