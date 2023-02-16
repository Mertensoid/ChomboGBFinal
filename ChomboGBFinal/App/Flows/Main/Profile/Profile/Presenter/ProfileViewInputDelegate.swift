//
//  ProfileViewInputDelegate.swift
//  ChomboGBFinal
//
//  Created by admin on 16.02.2023.
//

import Foundation

protocol ProfileViewInputDelegate: AnyObject {
    func showName(name: String)
    func showPost(post: String)
    func showEmail(email: String)
    func showWorkspaceLocation(location: String)
    func showMetrics()
}
