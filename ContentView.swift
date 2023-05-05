

import SwiftUI

struct ContentView: View {
    @State private var measurement = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let unitOptions = [ UnitLength.inches,UnitLength.feet, UnitLength.meters,UnitLength.kilometers]
    
    var conversion: Measurement<UnitLength>{
        let inputAmount = Measurement(value: Double(measurement) ?? 0, unit: unitOptions[inputUnit])
        let outputAmount = inputAmount.converted(to: unitOptions[outputUnit])
        return outputAmount
    }
    
    var formatter:MeasurementFormatter{
        let newFormat = MeasurementFormatter()
        newFormat.unitStyle = .long
        newFormat.unitOptions = .providedUnit
        return newFormat
        
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("\(formatter.string(from:unitOptions[inputUnit]))", text:$measurement).keyboardType(.decimalPad)
                    Picker("input unit", selection: $inputUnit){
                        ForEach(0 ..< unitOptions.count){
                            let formattedOutput = formatter.string(from: unitOptions[$0])
                            Text("\(formattedOutput)")
                        }
                    }.pickerStyle(.segmented)
                    
                    
                   
                    
                    
                } header: {
                    Text("Input Unit")
                }
                
                Section{
                    
                    Picker("output unit", selection: $outputUnit){
                        ForEach(0 ..< unitOptions.count){
                            let formattedOutput = formatter.string(from: unitOptions[$0])
                            Text("\(formattedOutput)")
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                Section{
                    Text(formatter.string(from: conversion))
                } header: {
                    Text("Result")
                }
            }.navigationTitle("Length Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
