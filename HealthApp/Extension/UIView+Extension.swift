//
//  UIView+Extension.swift
//  SCMBase
//
//  Created by Ruchin Somal on 30/01/20.
//  Copyright © 2020 SEW Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // optimize this using shadow path and rasterization
    var raised: Bool {
        set {
            if newValue {
                self.layer.shadowColor = UIColor.gray.cgColor
                self.layer.shadowOpacity = 0.3
                self.layer.shadowOffset = .zero
                self.layer.shadowRadius = 10
            } else {
                self.layer.shadowColor = UIColor.clear.cgColor
                self.layer.shadowOpacity = 0
                self.layer.shadowOffset = .zero
                self.layer.shadowRadius = 0
                self.layer.shadowPath = .none
            }
        }
        get {
            return true
        }
    }
    
    // MARK: - Extension  to make a view dotted
    // default dash length is 7 and length of the gap is 3
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint,dashlength dl: NSNumber = 5, gapLength gl: NSNumber = 3,_ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [dl, gl]
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    

    
    func addTopShadow() {
        let shadowSize: CGFloat = 5
        let height = -shadowSize * CGFloat(0.4)
        let contactRect = CGRect(x: 0, y: height, width: bounds.width, height: shadowSize)
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.40).cgColor
        self.layer.shadowPath =  UIBezierPath(rect: contactRect).cgPath
        self.layer.shadowRadius = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 0.3
    }
    
    func addShadow(cornerRadius: CGFloat, maskedCorners: CACornerMask = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner], color: UIColor, offset: CGSize, opacity: Float, shadowRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = maskedCorners
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
    }
    
    func addBorder(with cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
    
    // round top corner
    func roundTopCorners(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.addShadow(cornerRadius: cornerRadius, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], color: .clear, offset: .zero, opacity: 0.0, shadowRadius: 0.0)
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func subView(withTag: Int) -> UIView? {
        return self.subviews.filter { $0.tag == withTag }.first
    }
    
   

}
