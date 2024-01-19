//
//  SceneDelegate.swift
//  MarketApp
//
//  Created by Судур Сугунушев on 18.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let router = Router()
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = router.prepareInitialScreen()
        window?.makeKeyAndVisible()
    


    }

}
