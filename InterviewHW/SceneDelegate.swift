//
//  SceneDelegate.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/16.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vm = GridViewModel(m: 6, n: 3)
        let vc = GridViewController(viewModel: vm)
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }


}
