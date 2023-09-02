//
//  ActiveSheet.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 25.01.2021.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    
    case staffPositionList, showMainView
    var id: Int {
        hashValue
    }
}

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}


