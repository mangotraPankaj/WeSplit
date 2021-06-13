//
//  ContentView.swift
//  WeSplit
//
//  Created by Pankaj Mangotra on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Text("$\(checkAmount)")
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
