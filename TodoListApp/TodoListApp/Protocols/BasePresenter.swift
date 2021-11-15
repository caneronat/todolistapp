//
//  BasePresenter.swift
//  TodoListApp
//
//  Created by Caner Onat on 15.11.2021.
//

import Foundation

protocol BasePresenter {
    associatedtype I: BaseInteractor
    associatedtype R: BaseRouter
    var dependencies: (interactor: I, router: R) { get }
}

