//
//  TrackSleepControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 1/13/19.
//  Copyright © 2019 Andrew Kochulab. All rights reserved.
//

import UIKit

final class TrackSleepControllerView: ControllerView {
    
    // MARK: - Properties
    // MARK: Content
    
    var welcomeMessage: String {
        get {
            return welcomeLabel.text ?? ""
        }
        set {
            welcomeLabel.text = newValue
        }
    }
    
    // MARK: Views
    
    private lazy var headerView = configuredHeaderView()
    private lazy var dropsView = configuredDropsView()
    private lazy var welcomeLabel = configuredWelcomeLabel()
    private lazy var logoImageView = configuredLogoImageView()
    
    private lazy var contentView = configuredContentView()
    
    
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        headerView.round(
            corners: [.bottomLeft, .bottomRight],
            radius: 220,
            in: CGRect(x: 0, y: 0, width: frame.width, height: 400)
        )
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachHeaderView()
        attachDropsView()
        attachLogoImageView()
        attachWelcomeLabel()
        attachContentView()
        
        headerView.slideIn(from: .top, y: -400, duration: 0.7, delay: 0.4)
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.05882352963, blue: 0.1019607857, alpha: 1)
        
        return view
    }
    
    private func configuredHeaderView() -> View {
        let view = View()
        view.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.1215686275, blue: 0.1882352941, alpha: 1)
        view.layer.masksToBounds = true
        
        return view
    }
    
    private func configuredDropsView() -> WaterDropsView {
        return WaterDropsView {
            $0.color = UIColor.white
            $0.dropNum = 30
            $0.minLength = 100
            $0.maxLength = 400
            $0.direction = .down
            $0.minDuration = 2
            $0.maxDuration = 6
        }
    }
    
    private func configuredWelcomeLabel() -> Label {
        let label = Label()
        label.font = R.font.sofiaProLight(size: 24)
        label.textColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }
    
    private func configuredLogoImageView() -> ImageView {
        let imageView = ImageView()
        imageView.image = R.image.launchLogo()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    private func configuredContentView() -> View {
        return .init()
    }
    
    // MARK: Attachments
    
    private func attachHeaderView() {
        containerView.addSubview(headerView)
        
        headerView.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
            maker.height.equalTo(400)
        }
    }
    
    private func attachDropsView() {
        containerView.addSubview(dropsView)
        
        dropsView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private func attachWelcomeLabel() {
        headerView.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(40)
            maker.right.equalToSuperview().inset(40)
            maker.bottom.equalToSuperview().inset(166)
            maker.height.equalTo(100)
        }
    }
    
    private func attachLogoImageView() {
        containerView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(40)
            maker.right.equalToSuperview().inset(40)
            maker.height.equalTo(160)
            maker.top.equalToSuperview().inset(188)
        }
    }
    
    private func attachContentView() {
        containerView.addSubview(contentView)
        
        contentView.snp.makeConstraints { maker in
            maker.top.equalTo(headerView.snp.bottom)
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
    // MARK: Animation
    
    override func startInitialAnimation() {
        super.startInitialAnimation()
        
        dropsView.startAnimationIfNeeded()
    }
    
    override func stopInitialAnimation() {
        super.stopInitialAnimation()
        
        dropsView.stopAnimation()
    }
}
