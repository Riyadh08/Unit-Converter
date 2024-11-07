import Foundation
import SwiftUI

struct UnitConverterView: View {
    @State private var inputValue: Double?
    @State private var selectedInputUnit: UnitLength = .meters
    @State private var selectedOutputUnit: UnitLength = .feet
    @FocusState private var isInputFocused: Bool
    
    // Units available for conversion
    let availableUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    // Converted value
    var convertedValue: Double? {
        guard let inputValue = inputValue else {
            return nil
        }
        let inputMeasurement = Measurement(value: inputValue, unit: selectedInputUnit)
        return inputMeasurement.converted(to: selectedOutputUnit).value
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                PickerSection(
                    title: "Input Units",
                    units: availableUnits,
                    selectedUnit: $selectedInputUnit
                )
                
                PickerSection(
                    title: "Output Units",
                    units: availableUnits,
                    selectedUnit: $selectedOutputUnit
                )
                
                InputSection(
                    title: "Input Data",
                    placeholder: "Enter a number",
                    value: $inputValue,
                    isFocused: $isInputFocused
                )
                
                OutputSection(
                    title: "Converted Value",
                    output: convertedValue?.formatted() ?? "Please enter a value"
                )
                
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            .shadow(radius: 10)
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)) // Background color for the whole screen
    }
}

#Preview {
    UnitConverterView()
}
