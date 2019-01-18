//
//  ViewController.swift
//  BetterSleep
//
//  Created by Andrew Kochulab on 12/31/18.
//  Copyright © 2018 Andrew Kochulab. All rights reserved.
//

import UIKit

class ViewController<View, ViewModel>: UIViewController where
    View: ControllerView,
    ViewModel: ControllerViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    let viewModel: ViewModel
    
    // MARK: View
    
    let rootView: View
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Initialization
    
    init(
        view: View = .init(),
        viewModel: ViewModel
    ) {
        self.viewModel = viewModel
        self.rootView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil // No needed
    }
    
    
    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        setNeedsStatusBarAppearanceUpdate()
        
        configureView()
        configureViewModel()
        
        startInitialAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopInitialAnimation()
    }
    
    
    // MARK: - UI
    // MARK: Configuration
    
    func configureView() {
        rootView.configure()
    }
    
    func startInitialAnimation() {
        rootView.startInitialAnimation()
    }
    
    func stopInitialAnimation() {
        rootView.stopInitialAnimation()
    }
    
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    func configureViewModel() {
        
    }
}
