import Foundation
import SwiftUI

struct PickerSection: View {
    let title: String
    let units: [UnitLength]
    @Binding var selectedUnit: UnitLength
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.bottom, 4)
            Picker(title, selection: $selectedUnit) {
                ForEach(units, id: \.self) { unit in
                    Text(unit.symbol)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.1)))
            .padding(.bottom, 16)
        }
    }
}

struct InputSection: View {
    let title: String
    let placeholder: String
    @Binding var value: Double?
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.bottom, 4)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 8)
                    .frame(height: 50)
                
                TextField(placeholder, value: $value, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                    .padding(.horizontal, 16)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 20)
        }
    }
}

struct OutputSection: View {
    let title: String
    let output: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.bottom, 4)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(radius: 8)
                    .frame(height: 50)
                
                Text(output)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ContentView()
}
