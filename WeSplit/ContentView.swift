//
//  ContentView.swift
//  WeSplit
//
//  Created by Pankaj Mangotra on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25]
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = tipValue + orderAmount
        return grandTotal
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let perPersonShare = totalAmount / peopleCount
        return perPersonShare
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
//                    Picker("Number of People", selection: $numberOfPeople) {
//                        ForEach(2..<10) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip would you like to leave?")) {
                Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text( "Total amount")) {
                    
                    Text("$ \(totalAmount, specifier:"%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle(" WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
