//
//  ContentView.swift
//  adder
//
//  Created by Placidity on 2025-08-23.
//

import SwiftUI

struct ContentView: View {
    @State var value = 0
    @State var addInput = "1"
    @State var subInput = "1"
    var body: some View {
        VStack {
            Image(systemName: "numbers.rectangle.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .scaleEffect(2)
            Text("\n Counter")
            Text("\n\(value)")
                .font(.system(size: 50))
            
            HStack {
                Button("+"){
                    value = value + (Int(addInput) ?? 0)
                }
                Button("-"){
                    value = value - (Int(subInput) ?? 0)
                }
            }
            Text("Amount to add:")
            TextField("Amount to add", text: $addInput)
                .frame(width: 90)
                .onChange(of: addInput) { oldValue, newValue in
                    addInput = newValue.filter { "0123456789".contains($0) }
                }
            Text("Amount to subtract:")
            TextField("Amount to subtract", text: $subInput)
                .frame(width: 90)
                .onChange(of: subInput) { oldValue, newValue in
                    subInput = newValue.filter { "0123456789".contains($0) }
                }
            Spacer()
        }
        .padding(.top, 10)
        .padding()
        
        .frame(minHeight: 100)
    }
}

#Preview {
    ContentView()
}
