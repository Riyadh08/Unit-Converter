//
//  Componentsr.swift
//  Unit Converter
//
//  Created by Gaming Lab on 7/11/24.
//

import Foundation
import SwiftUI

struct PickerSection: View {
    let title: String
    let units: [UnitLength]
    @Binding var selectedUnit: UnitLength
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
            Picker(title,selection: $selectedUnit){
                ForEach(units, id:\.self){
                    unit in Text(unit.symbol)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}
    struct InputSection: View {
        let title: String
        let placeholder: String
        @Binding var value: Double?
        @FocusState.Binding var isFocused: Bool
        
        var body: some View {
            VStack(alignment: .leading){
                Text(title)
                    .font(.callout)
                    .foregroundColor(.gray)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 40)
                    TextField(placeholder, value: $value,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        .padding(.horizontal)
                }
            }
        }
    }
    struct OutputSection: View {
        let title : String
        let output: String
        var body: some View {
            VStack(alignment: .leading){
                Text(title)
                    .font(.callout)
                    .foregroundColor(.gray)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 40)
                    Text(output)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                }
            }
        }
    }

#Preview {
    ContentView()
}
