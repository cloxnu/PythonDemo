//
//  ContentView.swift
//  PythonDemo
//
//  Created by Sidney Liu on 2023/4/23.
//

import SwiftUI
import PythonKit

struct ContentView: View {
    @State var name: String = "Hello, World!"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(name)
            Button("Change") {
                greetingFromPython()
            }
        }
        .padding()
    }
    
    func greetingFromPython() {
        let greeting = Python.import("greeting")
        name = greeting.hello("Python!").description
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
