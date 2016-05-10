//
//  SKSpriteNode Extension.swift
//  Elemental Tower Defense
//
//  Created by Andrew Turley on 5/9/16.
//  Copyright © 2016 Polturonduken. All rights reserved.
//

import Foundation
import SpriteKit

extension SKSpriteNode {
    func rotate(enemy: SKSpriteNode, tower: SKSpriteNode) {
        var turn = SKAction.rotateToAngle(0, duration: 0)
        if enemy.position.x == tower.position.x {
            if enemy.position.y > tower.position.y {
//                self.zRotation = CGFloat(M_PI)
            }
            else {
                turn = SKAction.rotateToAngle(CGFloat(M_PI), duration: 0)
                
            }
        }
        else if enemy.position.y == tower.position.y {
            if tower.position.x < enemy.position.x {
                turn = SKAction.rotateToAngle(-1 * CGFloat(M_PI) / 2, duration: 0)
            }
            else {
                turn = SKAction.rotateToAngle(CGFloat(M_PI) / 2, duration: 0)
            }
        }
        else {
            if enemy.position.y > tower.position.y {
                if enemy.position.x < tower.position.x {
                    turn = SKAction.rotateToAngle(-1 * (((3 * CGFloat(M_PI)) / 2) + atan(abs(tower.position.y - enemy.position.y)/abs(tower.position.x - enemy.position.x))), duration: 0)
                }
                else {
                    turn = SKAction.rotateToAngle(((3 * CGFloat(M_PI)) / 2) + atan(abs(tower.position.y - enemy.position.y)/abs(tower.position.x - enemy.position.x)), duration: 0)
                }
            }
            else {
                if enemy.position.x < tower.position.x {
                    turn = SKAction.rotateToAngle((CGFloat(M_PI) / 2) + atan(abs(tower.position.x - enemy.position.x)/abs(tower.position.y - enemy.position.y)), duration: 0)
                }
                else {
                    turn = SKAction.rotateToAngle(CGFloat(M_PI) + atan(abs(tower.position.x - enemy.position.x)/abs(tower.position.y - enemy.position.y)), duration: 0)
                }
            }
        }
        
        self.runAction(turn)
    }
}