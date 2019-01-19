//
//  MonitoringTypeSelectionControl.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class MonitoringTypeSelectionControl: Control {
    
    // MARK: - Properties
    // MARK: Content
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    var title: String {
        get {
            return titleLabel.text ?? ""
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    private var titleColor: UIColor {
        return UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
    }
    
    private var selectedTitleColor: UIColor {
        return #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1).withAlphaComponent(0.95)
    }
    
    override var isSelected: Bool {
        didSet {
            containerView.backgroundColor = isSelected
                ? titleColor
                : selectedTitleColor
            
            imageView.backgroundColor = isSelected
                ? selectedTitleColor
                : titleColor
            
            titleLabel.textColor = isSelected
                ? selectedTitleColor
                : titleColor
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            containerView.alpha = isHighlighted ? 0.8 : 1
        }
    }
    
    // MARK: Views
    
    private lazy var containerView = configuredContainerView()
    private lazy var imageView = configuredImageView()
    private lazy var titleLabel = configuredTitleLabel()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachContainerView()
        attachImageView()
        attachTitleLabel()
    }
    
    private func configuredContainerView() -> View {
        let view = View()
        view.backgroundColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1).withAlphaComponent(0.95)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 18
        view.isUserInteractionEnabled = false
        
        return view
    }
    
    private func configuredImageView() -> ImageView {
        let imageView = ImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.isUserInteractionEnabled = false
        
        return imageView
    }
    
    private func configuredTitleLabel() -> Label {
        let label = Label()
        label.textColor = UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        label.font = R.font.sofiaProMedium(size: 18)
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        
        return label
    }
    
    // MARK: Attachments
    
    private func attachContainerView() {
        addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview().inset(12)
        }
    }
    
    private func attachImageView() {
        containerView.addSubview(imageView)
        
        imageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(8)
            maker.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func attachTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom).offset(14)
            maker.left.right.equalToSuperview().inset(6)
            maker.bottom.equalToSuperview().inset(8)
        }
    }
}
