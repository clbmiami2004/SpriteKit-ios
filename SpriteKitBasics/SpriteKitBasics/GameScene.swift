//
//  GameScene.swift
//  SpriteKitBasics
//
//  Created by Christian Lorenzo on 4/13/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    ///Images names:
    let sprite2 = SKSpriteNode(imageNamed: "spiderLeft")
    let sprite = SKSpriteNode(imageNamed: "myCar")
    let antAnimAct: SKAction
    
    override init(size: CGSize) {
        let antFrame0 = SKTexture(imageNamed: "spiderLeft")
        let antFrame1 = SKTexture(imageNamed: "spiderRight")
        let antTextures: [SKTexture] = [antFrame0, antFrame1]
        
        antAnimAct = SKAction.animate(with: antTextures, timePerFrame: 0.1)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        ///Changing the background color on the screen
        backgroundColor = UIColor.white
        
        ///Function to draw the line:
        drawLine(view: view)
        
        ///Function to draw a rectangle:
        drawRectangle(view: view)
        
        ///Function to add a rounded rectangle:
        drawRoundedRectangle(view: view)
        
        ///Function to add Oval on the screen:
        drawOval()
        
        creatingAVehicleImage()
        
        ///This will create a rectangle on the screen:
        //let sprite = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 100, height: 200))
        
        ///Utilizing the image from the assets instead of a rectangle:
        //sprite.position = CGPoint(x: 0, y: 0)
        //sprite.position = CGPoint(x: 224, y: 463) //This is where we will position the rectangle on the screen.
        //self.addChild(sprite)
        
        //This code is to show the ant walking by showing two different iomages:
        sprite2.run(SKAction.repeatForever(antAnimAct))
        
        ///Moving the rectangle to a different position on the screen in 3 seconds
        //let action1 = SKAction.move(to: CGPoint(x: 400, y: 850), duration: 3)
        
        ///Expanding the rectangle by doubling the size
        //let action2 = SKAction.scale(by: 2, duration: 1)
        
        ///Rotating the rectangle  - if you just place 90 on "byAngle" it will spin for 3 seconds like a slot machine. If we just want to rotate it normally then follow below:
        //let action3 = SKAction.rotate(byAngle: 0.5 * CGFloat.pi, duration: 2)
        
        ///Rotating the image to the left:
        //let action4 = SKAction.move(to: CGPoint(x: 224, y: 700), duration: 1)
        
        ///If we want to utilize all of the actions together at the same time, then we have to create a group and include all the actions inside the array, and run the group:
        //let actionGroup = SKAction.group([action1, action2, action3])
        
        ///If we want each action to perform one by one, then we have to replace the group with the sequence, like below:
        //let actionGroupSequence = SKAction.sequence([action1, action2, action3, action4])
        
        //sprite.run(actionGroupSequence)
        
        //This code is to make the sequential ant (walks left and right) to move around:
        let moveUp = SKAction.moveBy(x: 0, y: 300, duration: 3) //Duration is expressed in seconds
        let turnEast = SKAction.rotate(byAngle: -0.5 * CGFloat.pi, duration: 1)
        let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 1)
        let turnSouth = SKAction.rotate(byAngle: -0.5 * CGFloat.pi, duration: 1)
        let moveDown = SKAction.moveBy(x: 0, y: -300, duration: 3)
        let turnWest = SKAction.rotate(byAngle: -0.5 * CGFloat.pi, duration: 1)
        let moveLeft = SKAction.moveBy(x: -100, y: 0, duration: 1)
        let turnNorth = SKAction.rotate(byAngle: -0.5 * CGFloat.pi, duration: 1)
        
        let antSequence = SKAction.sequence([moveUp, turnEast, moveRight, turnSouth, moveDown, turnWest, moveLeft, turnNorth])
        sprite2.run(SKAction.repeatForever(antSequence))
    }
    
    ///Function to make an image to continue a path
//    override func update(_ currentTime: TimeInterval) {
//        sprite2.position = CGPoint(x: sprite2.position.x, y: sprite2.position.y + 2)
//    }
    
    ///Creating another image to be presented on the screen:
    func creatingAVehicleImage() {
        sprite2.position = CGPoint(x: 224, y: 50)
        self.addChild(sprite2)
    }
    
    ///This function is taking as parameter the "view", the same from the "didMove" function above, and when implementing it we have to pass the "view" as the
    ///parameter:
    func drawLine(view: SKView) {
        ///Drawing a line:
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: view.bounds.width, y: 200)) //We can use a number on the "x" and not the view, and remove the parameter from the function's signature.
        shape.path = path
        shape.strokeColor = _ColorLiteralType.green
        shape.lineWidth = 5
        addChild(shape)
    }
    
    func drawRectangle(view: SKView) {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addRect(CGRect(x: 65, y: 463, width: 300, height: 150))
        shape.path = path
        shape.strokeColor = UIColor.brown
        shape.lineWidth = 3
        addChild(shape)
    }
    
    func drawRoundedRectangle(view: SKView) {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addRoundedRect(in: CGRect(x: 65, y: 700, width: 300, height: 150), cornerWidth: 10, cornerHeight: 10)
        shape.path = path
        shape.strokeColor = UIColor.red
        shape.fillColor = UIColor.cyan
        shape.lineWidth = 3
        addChild(shape)
    }
    
    func drawOval() {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 65, y: 625, width: 300, height: 150))
        shape.path = path
        shape.strokeColor = UIColor.black
        shape.fillColor = UIColor.red
        shape.lineWidth = 6
        addChild(shape)
    }
    
    
    
}
