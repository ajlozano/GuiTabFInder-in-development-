//
//  ViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 4/4/23.
//

import UIKit

// MARK: TablatureFinderViewController

class TablatureFinderViewController: BaseViewController {
    
    var coordinator: TablatureFinderCoordinator?
    var viewModel: TablatureSelectorViewModel
    
    // TODO: Refactoring
    var loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    private (set) var tablaturesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var tablaturesTableViewDataSource: TablatureFinderTableViewDataSource = {
        var tableViewDataSource = TablatureFinderTableViewDataSource(tableView: tablaturesTableView, viewModel: viewModel)
        tableViewDataSource.registerCells()
        return tableViewDataSource
    }()
    
    private lazy var tablaturesTableViewDelegate: TablatureFinderTableViewDelegate = {
        let delegate = TablatureFinderTableViewDelegate(viewModel: viewModel)
        return delegate
    }()
    
    init(viewModel: TablatureSelectorViewModel = DefaultTablatureSelectorViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        setupView()
    }
    
    func setupBinders() {
        viewModel.loadingStatus.bind { [weak self] status in
            guard let self = self,
                  let status = status else { return }
            
            self.showLoader(status: status)
        }
        
        viewModel.model.bind { [weak self] model in
            guard let _ = model,
                  let self = self else { return }

            self.turnActivityIndicator(state: false)
            self.reloadView()
        }
        
        viewModel.tablatureDetailModel.bind { [weak self] detailModel in
            guard let detailModel = detailModel,
                  let self = self else { return }

            self.showTablatureDetailView(for: detailModel)
        }
        
        viewModel.showEmptyStateError.bind { [weak self] emptyState in
            guard let emptyState = emptyState,
                  let self = self else { return }
            
            self.manageEmptyStateView(for: emptyState)
        }
    }
}

// MARK: Setup View

extension TablatureFinderViewController {
    
    private func setupView() {
        view.backgroundColor = .white
        
        //viewModel.delegate = self
        setupSearchBarView()
        setupTablaturesTableView()
    }
    
    private func setupSearchBarView() {
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search tablature song"
        search.obscuresBackgroundDuringPresentation = false
        search.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = search
    }
    
    private func setupTablaturesTableView() {
        view.addSubview(tablaturesTableView)
        tablaturesTableView.separatorStyle = .singleLine
        tablaturesTableView.dataSource = tablaturesTableViewDataSource
        tablaturesTableView.delegate = tablaturesTableViewDelegate
        tablaturesTableView.backgroundColor = .systemBackground
        tablaturesTableView.accessibilityIdentifier = AccessibilityIdentifiers.tableView
        tablaturesTableView.isScrollEnabled = true
        setupTablaturesTableViewConstraints()
    }
}
    
// MARK: Manage reload view

extension TablatureFinderViewController {
    
    func reloadView() {
        DispatchQueue.main.async {
            self.tablaturesTableView.reloadData()
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
    
    private func manageEmptyStateView(for state: Bool) {
        
        DispatchQueue.main.async {
            if state {
                let background = EmptyStateView(frame: .zero)
                background.configure()
                self.tablaturesTableView.backgroundView = background
            } else {
                self.tablaturesTableView.backgroundView = nil
            }
        }
    }
}

// MARK: Activity indicator methods

extension TablatureFinderViewController {
    
    func setupActivityIndicator() {
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tablaturesTableView.frame.width / 2) - (width / 2)
        let y = (tablaturesTableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        loadingView.isHidden = true

        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)

        // Sets spinner
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.style = .large
        spinner.color = .black

        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)

        tablaturesTableView.addSubview(loadingView)
    }
    
    func turnActivityIndicator(state: Bool) {
        DispatchQueue.main.async {
            if (state) {
                self.loadingView.isHidden = false
                self.loadingLabel.isHidden = false
                self.spinner.startAnimating()
            } else {
                self.spinner.stopAnimating()
                self.loadingLabel.isHidden = true
                self.loadingView.isHidden = true
            }
        }
    }
}

// MARK: User actions

extension TablatureFinderViewController {
    
    func showTablatureDetailView(for model: TablatureDetail) {
        coordinator?.showTablatureDetail(for: model)
    }
}

// MARK: View Model delegate

//extension TablatureFinderViewController: TablatureFinderViewModelDelegate {
//    func didLoadInitialTablatures() {
//        self.turnActivityIndicator(state: false)
//        self.reloadView()
//    }
//    
//    func didLoadMoreTablatures(with newIndexPaths: [IndexPath]) {
//        DispatchQueue.main.async {
//            self.tablaturesTableView.performBatchUpdates {
//                self.tablaturesTableView.insertRows(at: newIndexPaths, with: .automatic)
//            }
//        }
//    }
//}
