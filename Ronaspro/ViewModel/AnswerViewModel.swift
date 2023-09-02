//
//  AnswerData.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 26.01.2021.
//



import Foundation

class AnswerViewModel: ObservableObject {
    static let shared = AnswerViewModel()
    @Published var workNames = [""]
    @Published var workCosts = [""]
    
    var costsInDouble: [Double] {//перевод стринг в дабл
        var total: [Double] = []
        workCosts.forEach { cost in
            total.append(Double(cost) ?? 0)
        }
        return total
    }
    
    func addRow() {
        workNames.append("")
        workCosts.append("")
    }
    
    func deleteLastRow() { //
        print(workNames.count)
        workNames.removeFirst()
        workCosts.removeFirst()
    }
    
    func totalCost()->Double {
        var total = 0.0
        workCosts.forEach { cost in
            total += Double(cost) ?? 0
        }
        return total
    }
}
