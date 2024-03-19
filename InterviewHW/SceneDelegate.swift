//
//  SceneDelegate.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/16.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = EntranceViewController()
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }


}
