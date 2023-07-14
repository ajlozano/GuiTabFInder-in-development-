//
//  TabViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 11/4/23.
//

import UIKit

class TablatureDetailViewController: BaseViewController {
    
    var coordinator: TablatureFinderCoordinator?
    var tablatureDetailInputModel: TablatureDetail
    var viewModel: TablatureDetailViewModel
    
    private (set) var emptyStateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var tablaturesScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private (set) var artistLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private (set) var tuningLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private (set) var tabTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    init(inputModel: TablatureDetail, viewModel: TablatureDetailViewModel = DefaultTablatureDetailViewModel()) {
        self.tablatureDetailInputModel = inputModel
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        setupView()
        self.viewModel.viewDidLoad(for: self.tablatureDetailInputModel)
    }
    
    private func setupBinders() {
        viewModel.loadingStatus.bind { [weak self] status in
            guard let self = self,
                  let status = status else { return }
            
            self.showLoader(status: status)
        }
        
        viewModel.tablatureDetailModel.bind { [weak self] model in
            guard let model = model,
                  let self = self else { return }
            self.reloadView(with: model)
        }
        
        viewModel.showEmptyStateError.bind { [weak self] emptyState in
                guard let state = emptyState,
                      let self = self else { return }
            
            self.manageEmptyStateView(for: state)
        }
    }
}

// MARK: Setup View

extension TablatureDetailViewController {
    
    func setupView() {
        view.backgroundColor = .systemBackground
        setupHeaderView()
        setupTabView()
        setupEmptyStateLabel()
    }
    
    private func setupHeaderView() {
        view.addSubview(artistLabel)
        artistLabel.textAlignment = .left
        artistLabel.textColor = .label
        artistLabel.font = Fonts.artist
        artistLabel.accessibilityIdentifier = AccessibilityIdentifiers.artist
        
        setupTablatureDetailArtistLabelConstraints()
        
        view.addSubview(tuningLabel)
        tuningLabel.textAlignment = .left
        tuningLabel.textColor = .label
        tuningLabel.font = Fonts.tuning
        tuningLabel.accessibilityIdentifier = AccessibilityIdentifiers.tuning
        
        setupTablatureDetailTuningLabelConstraints()
    }
    
    private func setupTabView() {
        
        view.addSubview(tablaturesScrollView)
        tablaturesScrollView.backgroundColor = .clear
        tablaturesScrollView.minimumZoomScale = 1.0
        tablaturesScrollView.maximumZoomScale = 3.0
        tablaturesScrollView.delegate = self
        
        setupTablatureDetailScrollViewConstraints()
        
        tablaturesScrollView.addSubview(tabTextView)
        tabTextView.font = UIFont.monospacedSystemFont(ofSize: 7, weight: .semibold)
        tabTextView.adjustsFontForContentSizeCategory = true
        tabTextView.isScrollEnabled = false

        setupTablatureDetailTablatureTextViewConstraints()
    }
    
    private func setupEmptyStateLabel() {
        view.addSubview(emptyStateLabel)
        
        emptyStateLabel.font = Fonts.emptyStateMessage
        emptyStateLabel.textColor = .black
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.numberOfLines = 0
        emptyStateLabel.text = Constants.emptyStateMessage
        emptyStateLabel.isHidden = true
        
        setupTablatureDetailEmptyStateLabelConstraints()
    }
}

// MARK: Manage reload View

extension TablatureDetailViewController {
    
    func reloadView(with model: TablatureDetail) {
        DispatchQueue.main.async {
            guard let tab = model.tab else {
                // TODO: Handle error event and view message
                return
            }
            
            self.artistLabel.text = model.artist
            self.tuningLabel.text = model.tabTuning ?? ""
            self.tabTextView.text = tab
        }
    }
    
    private func showLoader(status: LoadingStatus) {
        switch status {
        case .start:
            self.showSpinner()
        case .stop:
            self.hideSpinner()
        }
    }
    
    func manageEmptyStateView(for state: Bool) {
        
        DispatchQueue.main.async {
            if state {
                self.emptyStateLabel.isHidden = false
            } else {
                self.emptyStateLabel.isHidden = true
            }
        }
    }
}

