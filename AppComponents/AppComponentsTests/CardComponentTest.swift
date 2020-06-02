//
//  CardComponentTest.swift
//  AppComponents
//
//  Created by Felippe Matos Francoski on 02/06/20.
//  Copyright © 2020 ComponentsExample. All rights reserved.
//

@testable import AppComponents
import XCTest
import SnapshotTesting

class CardComponentTest: XCTestCase {
    
    let component: CardComponent = UIView.componentFromNib()
    
    func testBuildRender() {
        
        let dto = CardComponent.DTO(title: "This is an another example title", content: "This is an another example content", isFavorite: true)
        component.render(.build(dto))
        assertSnapshot(matching: component, as: .image)
    }
}
