//
//  ViewController.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 4/4/23.
//

import UIKit

// MARK: TablatureFinderViewController

class TablatureFinderViewController: UIViewController {
    
    var coordinator: TablatureFinderCoordinator?
    var viewModel: TablatureFinderViewModel
    
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
    
    init(viewModel: TablatureFinderViewModel = DefaultTablatureFinderViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupActivityIndicator()
        setupBinders()
        setupView()
    }
    
    func setupBinders() {
        viewModel.model.bind { [weak self] model in
            guard let _ = model,
                  let self = self else { return }
            
            self.turnActivityIndicator(state: false)
            self.reloadView()
        }
        
        viewModel.tablatureDetailModel.bind { [weak self] detailModel in
            guard let detailModel = detailModel,
                  let self = self else { return }
            
            //self.showEpisodeDetailView(for: detailModel)
        }
    }
}

// MARK: Setup View

extension TablatureFinderViewController {
    
    func setupView() {
        view.backgroundColor = .systemBackground
        setupSearchBarView()
        setupTablaturesTableView()
    }
    
    func setupSearchBarView() {
        search.searchBar.delegate = self
        search.searchResultsUpdater = self
        search.searchBar.placeholder = Localizables.searchBarPlaceHolder
        search.obscuresBackgroundDuringPresentation = false
        search.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = search
    }
    
    func setupTablaturesTableView() {
        view.addSubview(tablaturesTableView)
        tablaturesTableView.separatorStyle = .none
        tablaturesTableView.dataSource = tablaturesTableViewDataSource
        tablaturesTableView.delegate = tablaturesTableViewDelegate
        tablaturesTableView.backgroundColor = .systemGroupedBackground
        tablaturesTableView.accessibilityIdentifier = AccessibilityIdentifiers.tableView
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
    
    // TODO: Refactor activity Indicator
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
    
    func showTablatureDetailView(for model: TablatureDetails) {
        // TODO: Call coordinator to go to detail view
    }
}