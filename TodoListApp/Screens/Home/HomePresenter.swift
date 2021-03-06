//
//  HomePresenter.swift
//  TodoListApp
//
//  Created by Caner Onat on 15.11.2021.
//

import UIKit

typealias HomePresenterDependencies = (
    interactor: HomeInteractor,
    router: HomeRouterOutput
)

class HomePresenter: BasePresenter {
    
    var entities: HomeEntities
    private weak var view: HomeViewInputs!
    let dependencies: HomePresenterDependencies
    
    init(entities: HomeEntities, view: HomeViewInputs, dependencies: HomePresenterDependencies) {
        self.view = view
        self.entities = entities
        self.dependencies = dependencies
    }
}

extension HomePresenter: HomeViewOutputs {
    
    func viewWillAppear() {
        if entities.tableViewSource != nil{
            dependencies.interactor.setTableView(router: dependencies.router)
        }
    }
    
    func viewDidLoad() {
        setUI()
    }
    
    func setUI(){
        entities.viewTitle.frame = CGRect(x: 0, y: 0, width: view.getParentController().view.frame.width, height: view.getParentController().navigationController?.navigationBar.frame.height ?? 0)
        entities.viewTitle.setTitleUI(type: NavigationTitleTypes.TitleHome)
        entities.viewTitle.ivAddNote.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ivAddNoteTapped)))
        
        view.getParentController().navigationItem.titleView = entities.viewTitle
        
        view.getParentController().tableView.tableFooterView = UIView()
        view.getParentController().tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        dependencies.interactor.setTableView(router: dependencies.router)
    }
    
    @objc func ivAddNoteTapped(_ sender: UITapGestureRecognizer){
        dependencies.router.presentAddTask()
    }
}

extension HomePresenter: HomeInteractorOutputs{
    func onTableViewReady(source: HomeTableViewSource?) {
        view.getParentController().viewNoResult.isHidden = !(source?.items.count ?? 0 == 0)
        
        view.getParentController().tableView.dataSource = source
        view.getParentController().tableView.delegate = source
        view.getParentController().tableView.reloadData()
    }
}

