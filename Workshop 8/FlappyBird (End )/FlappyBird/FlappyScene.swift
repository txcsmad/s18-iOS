//
//  FlappyScene.swift
//  FlappyBird
//
//  Created by Matthew Ruston on 4/2/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import SpriteKit

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

class FlappyScene: SKScene {
    
    private let birdNode: SKSpriteNode = {
        let birdTexture = SKTexture(image: #imageLiteral(resourceName: "Bird1"))
        birdTexture.filteringMode = .nearest
        
        let birdTexture2 = SKTexture(image: #imageLiteral(resourceName: "Bird2"))
        birdTexture2.filteringMode = .nearest
        
        let birdNode = SKSpriteNode(texture: birdTexture)
        birdNode.setScale(2)
        
        let flapAction = SKAction.animate(with: [birdTexture2, birdTexture], timePerFrame: 0.2)
        let flapForeverAction = SKAction.repeatForever(flapAction)
        
        birdNode.run(flapForeverAction)
        
        birdNode.physicsBody = SKPhysicsBody(texture: birdTexture, size: birdNode.size)
        birdNode.physicsBody?.isDynamic = true
        birdNode.physicsBody?.allowsRotation = false
        
        return birdNode
    }()
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        backgroundColor = SKColor(red: 113.0 / 255.0, green: 197.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        addChild(birdNode)
        birdNode.position = frame.center
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        func clamp(min: CGFloat, max: CGFloat, value: CGFloat) -> CGFloat {
            if value > max {
                return max
            } else if value < min {
                return min
            } else {
                return value
            }
        }
        
        let value = birdNode.physicsBody!.velocity.dy * (birdNode.physicsBody!.velocity.dy < 0 ? 0.003 : 0.001)
        birdNode.zRotation = clamp(min: -1, max: 0.5, value: value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody?.velocity = .zero
        birdNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
    }
    
}
