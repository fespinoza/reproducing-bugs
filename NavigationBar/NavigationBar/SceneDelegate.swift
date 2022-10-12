//
//  SceneDelegate.swift
//  NavigationBar
//
//  Created by Felipe Espinoza on 12/10/2022.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        /// 2. Create a new UIWindow using the windowScene constructor which takes in a window scene.
        let window = UIWindow(windowScene: windowScene)

        /// 3. Create a view hierarchy programmatically
        let viewController = UIHostingController(rootView: RootView())

        /// 4. Set the root view controller of the window with your view controller
        window.rootViewController = viewController

        /// 5. Set the window and call makeKeyAndVisible()
        self.window = window
        window.makeKeyAndVisible()
    }
}
