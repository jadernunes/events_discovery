//
//  SceneDelegate.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    var window: UIWindow?
    private var coordinator: AppCoordinator?

    // MARK: - Life cycle

    convenience init(window: UIWindow) {
        self.init()
        self.window = window
    }

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(frame: windowScene.screen.bounds)
        window.windowScene = windowScene

        self.window = window

        coordinator = AppCoordinator(window: window)
        coordinator?.start()
    }
}
