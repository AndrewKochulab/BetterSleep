//
//  WakeUpWindowNameTableViewCell.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/19/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class WakeUpWindowNameTableViewCell: TableViewCell {
    
    // MARK: - Properties
    // MARK: Content
    
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
    
    // MARK: Views
    
    private lazy var titleLabel = configuredTitleLabel()
    
    
    // MARK: - View lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        title = ""
    }
    
    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        titleLabel.textColor = selected
            ? selectedTitleColor
            : titleColor
        
        containerView.backgroundColor = selected
            ? titleColor
            : selectedTitleColor
    }
    
    override func setHighlighted(
        _ highlighted: Bool,
        animated: Bool
    ) {
        UIView.animate(withDuration: 0.2) {
            self.titleLabel.textColor = highlighted
                ? self.selectedTitleColor
                : self.titleColor
            
            self.containerView.backgroundColor = highlighted
                ? self.titleColor
                : self.selectedTitleColor
        }
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachTitleLabel()
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1).withAlphaComponent(0.95)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        
        return view
    }
    
    private func configuredTitleLabel() -> Label {
        let label = Label()
        label.textColor = UIColor(red: 22.0 / 255.0, green: 160.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
        label.font = R.font.sofiaProMedium(size: 18)
        label.textAlignment = .center
        
        return label
    }
    
    // MARK: Attachments
    
    override func attachContainerView() {
        addSubview(containerView)
        
        containerView.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview().inset(6)
            maker.left.right.equalToSuperview()
        }
    }
    
    private func attachTitleLabel() {
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview().inset(12)
            maker.left.right.equalToSuperview().inset(6)
        }
    }
}
