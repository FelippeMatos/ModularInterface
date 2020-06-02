//
//  ComponentFromNib.swift
//  AppComponents
//
//  Created by Felippe Matos Francoski on 01/06/20.
//  Copyright © 2020 Felippe Matos Francoski. All rights reserved.
//

import UIKit

extension UIView {
    
    public class func componentFromNib<T: UIView>() -> T {
        guard let component = Bundle.componentsBundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T else {
            fatalError("Xib not found")
        }
        return component
    }
    
    public func pinToBounds(of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension Bundle {
    
    class func componentsBundle(for componentClass: AnyClass) -> Bundle {
        if  let bundleURL = Bundle(for: componentClass).url(forResource: "AppComponents", withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL)  {
            return bundle
        }
        if let bundle = Bundle(identifier: "br.com.components.AppComponents") {
            return bundle
        }
        fatalError("Bundle not found")
    }
}
