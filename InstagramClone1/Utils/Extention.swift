//
//  Extention.swift
//  InstagramClone1
//
//  Created by Дмитрий Папушин on 17.04.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

extension UIView {

    //This pins a child view to the edges of the passed superView. Very common constraint setup.
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                             = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive           = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive   = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive     = true
    }


    // This quickly applies a drop shadow to a view. You could pull out some of these
    // properties and make them parameters so it's more customizable when you call it.
    // However, I typically find that a shadow style is likely to be universal for a project.
    // I have masksToBounds on there so it can be used on a view with a cornerRadius.

    func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.35
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shouldRasterize = true
    }


    // Sets the background of any view to a gradient.
    func setGradientBackground(top: UIColor, bottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        let colorTop = top.cgColor as CGColor
        let colorBottom = bottom.cgColor as CGColor

        gradientLayer.frame = bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIButton {

    // Basic animations on a button
    // How it's used: button.pulsate() or button.flash() or button.shake()

    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

        layer.add(pulse, forKey: "pulse")
    }


    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3

        layer.add(flash, forKey: nil)
    }


    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true

        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)

        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)

        shake.fromValue = fromValue
        shake.toValue = toValue

        layer.add(shake, forKey: "position")
    }

    
    // The last two are adjusting the UI. Rounding corners or setting a border if needed.
    // How it's used: button.roundCorners() or button.setBorder(color: .red, width: 2.0)

    func roundCorners() {
        layoutIfNeeded()
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
    }


    func setBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

var imageCache = [String: UIImage]()


extension UIImageView {
    
    func loadImage(with urlString: String) {
        
        if let cachedImage = imageCache[urlString] {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to load image: ", err.localizedDescription)
                return
            }
            
            guard let imageData = data else {return}
            
            let profileImage = UIImage(data: imageData)
            
            imageCache[url.absoluteString] = profileImage
            
            DispatchQueue.main.async {
                self.image = profileImage
            }
        }.resume()
    }
    
}


