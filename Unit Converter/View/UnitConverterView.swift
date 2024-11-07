//
//  UnitConverterView.swift
//  Unit Converter
//
//  Created by Gaming Lab on 7/11/24.
//

import Foundation
import SwiftUI
struct UnitConverterView: View {
    @State private var inputValue: Double?
    @State private var selectedInputUnit: UnitLength = .meters
    @State private var selectedOutputUnit: UnitLength = .feet
    @FocusState private var isInputFocused: Bool
    let availableUnits: [UnitLength]=[.meters,.kilometers,.feet,.yards,.miles]
    var convertedValue: Double?{
        guard let inputValue = inputValue else {
            return nil
        }
        let inputMeasurement = Measurement(value: inputValue, unit: selectedInputUnit)
        return inputMeasurement.converted(to: selectedOutputUnit).value
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 30){
                PickerSection(
                    title: "Input Units",
                    units: availableUnits,
                    selectedUnit : $selectedInputUnit
                )
                PickerSection(
                    title: "Output Units",
                    units: availableUnits,
                    selectedUnit : $selectedOutputUnit
                )
                InputSection(
                    title: "Input Data",
                    placeholder: "Enter a number",
                    value: $inputValue,
                    isFocused: $isInputFocused
                )
                OutputSection(
                    title: "Result",
                    output: convertedValue?.formatted() ?? ""
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
