//
//  NotificationView.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/28/20.
//

import Foundation

public class NotificationView: StandardView {

    public var mainColor: UIColor = UIColor.init(red: 255, green: 24, blue: 119, alpha: 1.0)

    private lazy var iconImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        return label
    }()

    public init(frame: CGRect = .zero, icon: UIImage = UIImage(), text: String = "Error notification", height: CGFloat = 48) {
        super.init(frame: frame)
        self.configure(icon: icon, text: text, height: height)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.setup()
    }

    public func configure(icon: UIImage = UIImage(), text: String = "Error notification", height: CGFloat = 48) {
        self.isHidden = true
        self.iconImgView.image = icon
        self.titleLabel.text = text
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setup () {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.backgroundColor = self.mainColor.cgColor
    }

    @objc func onTapClose() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0.0
            self.removeFromSuperview()
        })
    }

}
