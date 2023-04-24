//
//  PythonDemoApp.swift
//  PythonDemo
//
//  Created by Sidney Liu on 2023/4/23.
//

import SwiftUI
import Python
import PythonKit

@main
struct PythonDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        guard let stdLibPath = Bundle.main.path(forResource: "python-stdlib", ofType: nil) else { return }
        guard let libDynloadPath = Bundle.main.path(forResource: "python-stdlib/lib-dynload", ofType: nil) else { return }
        setenv("PYTHONHOME", stdLibPath, 1)
        setenv("PYTHONPATH", "\(stdLibPath):\(libDynloadPath)", 1)
        Py_Initialize()
        
        self.importSrc()
    }
    
    func importSrc() {
        guard let srcPath = Bundle.main.path(forResource: "python-src", ofType: nil) else { return }
        let sys = Python.import("sys")
        
        sys.path.append(srcPath)
        
        print("Python Version: \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
        print("Python Path: \(sys.path)")
        
    }
}
