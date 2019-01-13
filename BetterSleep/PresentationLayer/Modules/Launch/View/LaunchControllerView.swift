//
//  LaunchControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/7/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class LaunchControllerView: ControllerView {
    
    // MARK: - Properties
    // MARK: Content
    
    var animationDuration: TimeInterval = 1.2
    
    // MARK: Callbacks
    
    var didFinishAnimation: EmptyClosure?
    
    // MARK: Views
    
    private lazy var logoImageView = configuredLogoImageView()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachLogoImageView()
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.1215686275, blue: 0.1882352941, alpha: 1)
        
        return view
    }
    
    private func configuredLogoImageView() -> ImageView {
        let imageView = ImageView()
        imageView.image = R.image.launchLogo()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    // MARK: Attachments
    
    private func attachLogoImageView() {
        containerView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { maker in
            maker.height.equalTo(160)
            maker.top.equalToSuperview().inset(188)
            maker.left.equalToSuperview().inset(40)
            maker.right.equalToSuperview().inset(40)
        }
    }
    
    // MARK: Animation
    
    override func startInitialAnimation() {
        super.startInitialAnimation()
        
        logoImageView.bounceIn(from: .bottom, y: 92, duration: animationDuration, damping: 1, completion: { [unowned self] _ in
            self.didFinishAnimation?()
        })
    }
}
