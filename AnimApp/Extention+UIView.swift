//
//  Extention+UIView.swift
//  AnimApp
//
//  Created by Иван Маришин on 23.06.2021.
//

import UIKit

extension UIView {
    
    func randomAnimate(now: UILabel) {
        
        let duration: CFTimeInterval = 1.0
        
        enum AnimationsList: CaseIterable {
            case Shake
            case Pop
            case FlipX
            case FlipY
            case Morph
            case Squeeze
            case Flash
            case Wobble
            case Swing

        }
        
        let animation: AnimationsList = AnimationsList.allCases.randomElement()!
            switch animation {
            case .Shake:
                now.text = "Shake"
                let animation = CAKeyframeAnimation()
                animation.keyPath = "position.x"
                animation.values = [0, 30, -30, 30, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                layer.add(animation, forKey: "shake")
            case .Pop:
                now.text = "Pop"
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.scale"
                animation.values = [0, 0.2, -0.2, 0.2, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                layer.add(animation, forKey: "pop")
            case .FlipX:
                now.text = "FlipX"
                var perspective = CATransform3DIdentity
                perspective.m34 = -1.0 / layer.frame.size.width/2
                
                let animation = CABasicAnimation()
                animation.keyPath = "transform"
                animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(0, 0, 0, 0))
                animation.toValue = NSValue(caTransform3D:
                    CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(CGFloat.pi), 0, 1, 0)))
                animation.duration = CFTimeInterval(duration)
                layer.add(animation, forKey: "3d")
            case .FlipY:
                now.text = "FlipY"
                var perspective = CATransform3DIdentity
                perspective.m34 = -1.0 / layer.frame.size.width/2
                
                let animation = CABasicAnimation()
                animation.keyPath = "transform"
                animation.fromValue = NSValue(caTransform3D:
                    CATransform3DMakeRotation(0, 0, 0, 0))
                animation.toValue = NSValue(caTransform3D:
                    CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(CGFloat.pi), 1, 0, 0)))
                animation.duration = CFTimeInterval(duration)
                layer.add(animation, forKey: "3d")
            case .Morph:
                now.text = "Morph"
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.3, 0.7, 1.3, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.duration = CFTimeInterval(duration)
                layer.add(morphX, forKey: "morphX")
                
                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.7, 1.3, 0.7, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.duration = CFTimeInterval(duration)
                layer.add(morphY, forKey: "morphY")
            case .Squeeze:
                now.text = "Squeeze"
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.5, 0.5, 1.5, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.duration = CFTimeInterval(duration)
                layer.add(morphX, forKey: "morphX")
                
                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.5, 1, 0.5, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.duration = CFTimeInterval(duration)
                layer.add(morphY, forKey: "morphY")
            case .Flash:
                now.text = "Flash"
                let animation = CABasicAnimation()
                animation.keyPath = "opacity"
                animation.fromValue = 1
                animation.toValue = 0
                animation.duration = CFTimeInterval(duration)
                animation.autoreverses = true
                layer.add(animation, forKey: "flash")
            case .Wobble:
                now.text = "Wobble"
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.rotation"
                animation.values = [0, 0.3, -0.3, 0.3, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                layer.add(animation, forKey: "wobble")
                
                let x = CAKeyframeAnimation()
                x.keyPath = "position.x"
                x.values = [0, 30, -30, 30, 0]
                x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                x.duration = CFTimeInterval(duration)
                x.isAdditive = true
                layer.add(x, forKey: "x")
            case .Swing:
                now.text = "Swing"
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.rotation"
                animation.values = [0, 0.3, -0.3, 0.3, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                layer.add(animation, forKey: "swing")
            }
    }
}
