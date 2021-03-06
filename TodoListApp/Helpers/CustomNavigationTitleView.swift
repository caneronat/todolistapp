//
//  CustomNavigationTitleView.swift
//  TodoListApp
//
//  Created by Caner Onat on 15.11.2021.
//

import UIKit

final class CustomNavigationTitleView: UIView {
    
    @IBOutlet weak var ivAddNote: UIImageView!
    @IBOutlet weak var viewTitleUpdateNote: UIView!
    @IBOutlet weak var viewTitleAddNote: UIView!
    @IBOutlet weak var viewTitleHome: UIView!
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    class func instanceFromNib() -> CustomNavigationTitleView {
        return UINib(nibName: "CustomNavigationTitleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomNavigationTitleView
    }
    
    func setTitleUI(type: NavigationTitleTypes){
        switch type {
        case NavigationTitleTypes.TitleHome:
            viewTitleHome.isHidden = false
        case NavigationTitleTypes.TitleAddNote:
            viewTitleAddNote.isHidden = false
        case NavigationTitleTypes.TitleUpdateNote:
            viewTitleUpdateNote.isHidden = false
        }
    }
}

