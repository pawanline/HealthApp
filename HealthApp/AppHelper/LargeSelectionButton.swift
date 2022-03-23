//
//  LargeSelectionButton.swift
//  HealthApp
//
//  Created by Pawan Kumar on 29/10/21.
//

import Foundation

import Foundation
import UIKit

struct LargeSelectionButtonConfig {
    var titleFont:UIFont!
    var titleColor:UIColor!
    var backgroundColor:UIColor
    var state:LargeSelectionButton.State
}

class LargeSelectionButton: UIButton {
    public enum ActionType {
        case submit
    }
    
    // MARK: - Properties
    private var _selectedFont: UIFont = UIFont.systemFont(ofSize: 17.0)
    private var _normalFont: UIFont = UIFont.systemFont(ofSize: 17.0)
    private var _highlightedFont: UIFont = UIFont.systemFont(ofSize: 17.0)
    
    var border: Bool = false {
        didSet {
            if border {
                self.layer.borderWidth = 1
                self.layer.cornerRadius = 5
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.shadowColor = UIColor.lightGray.cgColor
            } else {
                self.layer.borderColor = UIColor.clear.cgColor
                self.layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }
    
    var type:ActionType = .submit {
        didSet {
            // set font and colos related to button
            switch type {
            case .submit:
                self.backgroundColor = UIColor.purple
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitleFont(font: UIFont.systemFont(ofSize: 16.0),for: .normal)
                self.setTitleFont(font: UIFont.systemFont(ofSize: 16.0), for: .selected)
            }
             // Fonts
            setFontForState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.intitalSetup()
    }
    
    override var isHighlighted: Bool {
           didSet {
               setFontForState()
           }
       }
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
    
    private func intitalSetup() {
        myCornerRadius = 16.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 4.0
        type = .submit
    }

    var myCornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.myCornerRadius
        }
    }
    
    var fontForTitle: UIFont = UIFont.systemFont(ofSize: 11.0) {
        didSet {
            self.titleLabel?.font = fontForTitle
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setFontForState() {
        if state == .selected {
            self.titleLabel?.font = _selectedFont
        } else if state == .highlighted {
            self.titleLabel?.font = _highlightedFont
        } else {
            self.titleLabel?.font = _normalFont
        }
    }

    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image?.withRenderingMode(.alwaysOriginal), for: state)
        self.bringSubviewToFront(self.imageView!)
    }
    


    
    private func setTitleFont(font: UIFont, for state: UIControl.State) {
        if state == .normal {
            _normalFont = font
        } else if state == .highlighted {
            _highlightedFont = font
        } else {
            _selectedFont = font
        }
    }
    
    private func setAttributedTitle(_ title: String, for state: UIControl.State) {
        super.setTitle("", for: state)
        let attributedString =
            NSMutableAttributedString(string: title,
                                      attributes: [
                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0),
                                        NSAttributedString.Key.foregroundColor: UIColor.gray,
                                        NSAttributedString.Key.accessibilityTextHeadingLevel: "India",
                                        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        super.setAttributedTitle(attributedString, for: state)
    }
}
