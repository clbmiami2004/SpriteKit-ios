//
//  GameViewController.swift
//  SpriteKitBasics
//
//  Created by Christian Lorenzo on 4/13/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            //scene.size = view.bounds.size
            view.presentScene(scene)
            print(scene.size) //This is to verify the size and to print it on the logs
        }
    }
}
