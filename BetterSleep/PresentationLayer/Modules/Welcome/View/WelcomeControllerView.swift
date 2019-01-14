//
//  WelcomeControllerView.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

final class WelcomeControllerView: ControllerView {
    
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
    
    // MARK: Callbacks
    
    var didStartTouchUpInside: DidTouchUpInside?
    
    // MARK: Views
    
    private lazy var headerView = configuredHeaderView()
    private lazy var dropsView = configuredDropsView()
    private lazy var welcomeLabel = configuredWelcomeLabel()
    private lazy var logoImageView = configuredLogoImageView()
    
    private lazy var contentView = configuredContentView()
    private lazy var bottomImageView = configuredBottomImageView()
    private lazy var startButton = configuredStartButton()
    
    
    // MARK: - View lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        headerView.round(corners: [.bottomLeft, .bottomRight], radius: 220)
        startButton.round(radius: startButton.bounds.height / 2.0)
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
        attachBottomImageView()
        attachStartButton()
        
        welcomeLabel.bounceIn(from: .top, y: 100, duration: 0.7, damping: 0.8)
        startButton.bounceIn(from: .bottom, y: 400, duration: 0.7, delay: 0.7, damping: 0.8)
        bottomImageView.bounceIn(from: .bottom, y: 500, duration: 0.7, delay: 0.5, damping: 0.8)
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.1215686275, blue: 0.1882352941, alpha: 1)
        
        return view
    }
    
    private func configuredHeaderView() -> View {
        let view = View()
        view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.1411764706, blue: 0.2117647059, alpha: 1)
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
    
    private func configuredStartButton() -> Button {
        let button = Button()
        button.didTouchUpInside = { [unowned self] button in
            self.didStartTouchUpInside?(button)
        }
        
        button.backgroundColor = #colorLiteral(red: 0.8789252639, green: 0.9116950631, blue: 0.924718082, alpha: 1).withAlphaComponent(0.95)
        
        button.setAttributedTitle(
            NSAttributedString(
                string: "START",
                attributes: [
                    .font : R.font.sofiaProRegular(size: 22)!,
                    .foregroundColor : #colorLiteral(red: 0.02203287371, green: 0.1203582063, blue: 0.1882305741, alpha: 1)
                ]
            ),
            for: .init()
        )
        
        return button
    }
    
    private func configuredBottomImageView() -> ImageView {
        let imageView = ImageView()
        imageView.image = R.image.welcomeSleepIcon()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    // MARK: Attachments
    
    private func attachHeaderView() {
        containerView.addSubview(headerView)
        
        headerView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.height.equalTo(400)
        }
    }
    
    private func attachDropsView() {
        containerView.addSubview(dropsView)
        
        dropsView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    private func attachLogoImageView() {
        headerView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(40)
            maker.right.equalToSuperview().inset(40)
            maker.height.equalTo(160)
            maker.bottom.equalToSuperview().inset(52)
        }
    }
    
    private func attachWelcomeLabel() {
        headerView.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { maker in
            maker.left.equalTo(logoImageView.snp.left)
            maker.right.equalTo(logoImageView.snp.right)
            maker.bottom.equalToSuperview().inset(166)
            maker.height.equalTo(100)
        }
    }
    
    private func attachContentView() {
        containerView.addSubview(contentView)
        
        contentView.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalTo(headerView.snp.bottom)
            maker.bottom.equalToSuperview()
        }
    }
    
    private func attachBottomImageView() {
        contentView.addSubview(bottomImageView)
        
        bottomImageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(70)
            maker.right.equalToSuperview().inset(40)
            maker.top.equalToSuperview().inset(20)
            maker.height.equalTo(160)
        }
    }
    
    private func attachStartButton() {
        contentView.addSubview(startButton)
        
        startButton.snp.makeConstraints { maker in
            maker.width.equalTo(240)
            maker.height.equalTo(52)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(bottomImageView.snp.bottom).offset(20)
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
