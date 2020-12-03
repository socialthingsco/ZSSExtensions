//
//  NotificationView.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/21/20.
//

import UIKit

enum ButtonStyle {
    case clearWithBorder
    case darkBlue
    case yellow
    case green
    case disabled
    case ghost
}

public class LoginButton: UIButton, FormButton {
    var style: ButtonStyle = .yellow {
        didSet {
            render(style: style)
        }
    }

    public var mainColor: UIColor = .systemYellow

    private let loader = UIActivityIndicatorView(style: .medium)

    @objc func onTouchDown() {
        render(style: style, isTouching: true)
    }

    @objc func onTouchEnd() {
        render(style: style, isTouching: false)
    }

    private var isLightBackground = false

    public init(frame: CGRect = .zero, text: String = "Button", height: CGFloat = 50, isLightBackground: Bool = false) {
        super.init(frame: frame)
        self.configure(height: height, isLightBackground: isLightBackground)
        setTitle(text, for: .normal)
        self.setup()
    }

    func configure(height: CGFloat = 50, isLightBackground: Bool = false) {
        self.isLightBackground = isLightBackground
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setup () {
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        translatesAutoresizingMaskIntoConstraints = false

        loader.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loader)
        Constraint.activate(
            Constraint.equalCenterX(self, loader),
            Constraint.equalCenterY(self, loader)
        )

        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.backgroundColor = self.mainColor.cgColor

        render(style: style)

        addTarget(self, action: #selector(onTouchDown), for: .touchDown)
        addTarget(self, action: #selector(onTouchEnd), for: .touchCancel)
        addTarget(self, action: #selector(onTouchEnd), for: .touchUpInside)
        addTarget(self, action: #selector(onTouchEnd), for: .touchUpOutside)
    }

    func setButtonStyle(textColor: UIColor, backgroundColor: UIColor, borderColor: UIColor, alpha: CGFloat = 1) {
        setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.borderColor = borderColor.cgColor
        self.alpha = alpha
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.setup()
    }

    func render(style: ButtonStyle, isTouching: Bool = false, isLoading: Bool = false) {
        isEnabled = style != .disabled && !isLoading
        switch style {
        case .yellow:
            loader.color = .white
            if isTouching {
                setButtonStyle(textColor: .white, backgroundColor: .brown, borderColor: .brown)
            } else {
                setButtonStyle(textColor: .white, backgroundColor: self.mainColor, borderColor: self.mainColor)
            }
        case .disabled:
            loader.color = .white
            setButtonStyle(textColor: isLightBackground ? .darkGray : .white, backgroundColor: .lightGray,
                           borderColor: isLightBackground ? .darkGray : .white, alpha: 0.5)
        case .ghost:
            loader.color = .white
            if isTouching {
                setButtonStyle(textColor: .blue, backgroundColor: .white, borderColor: .white)
            } else {
                setButtonStyle(textColor: .white, backgroundColor: .clear, borderColor: .white)
            }
        case .clearWithBorder:
            loader.color = .blue
            if isTouching {
                setButtonStyle(textColor: .blue, backgroundColor: .clear, borderColor: .lightGray)
            } else {
                setButtonStyle(textColor: .blue, backgroundColor: .clear, borderColor: .lightGray)
            }
        case .darkBlue:
            loader.color = .blue
            if isTouching {
                setButtonStyle(textColor: .white, backgroundColor: .blue, borderColor: .clear)
            } else {
                setButtonStyle(textColor: .white, backgroundColor: .blue, borderColor: .clear)
            }
        case .green:
            loader.color = .white
            if isTouching {
                setButtonStyle(textColor: .white, backgroundColor: .green, borderColor: .clear)
            } else {
                setButtonStyle(textColor: .white, backgroundColor: .green, borderColor: .clear)
            }
        }
        if isLoading {
            loader.isHidden = false
            loader.startAnimating()
            titleLabel?.alpha = 0
        } else {
            loader.isHidden = true
            titleLabel?.alpha = 1
            loader.stopAnimating()
        }
    }

    // FormButton

    public func formButtonSetLoading(_ loading: Bool) {
        render(style: style, isLoading: loading)
    }

    public func formButtonSetEnabled(_ enabled: Bool) {
        if enabled {
            render(style: style)
        } else {
            render(style: .disabled)
        }
    }
}
