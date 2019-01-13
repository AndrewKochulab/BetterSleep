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
    // MARK: Views
    
    private lazy var headerView = configuredHeaderView()
    private lazy var logoImageView = configuredLogoImageView()
    
    private lazy var contentView = configuredContentView()
    
    
    // MARK: - UI
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        attachHeaderView()
        attachLogoImageView()
        attachContentView()
    }
    
    override func configuredContainerView() -> View {
        let view = super.configuredContainerView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.05882352963, blue: 0.1019607857, alpha: 1)
        
        return view
    }
    
    private func configuredHeaderView() -> View {
        return .init()
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
            maker.height.equalTo(500)
        }
    }
    
    private func attachLogoImageView() {
        headerView.addSubview(logoImageView)
        
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
}
