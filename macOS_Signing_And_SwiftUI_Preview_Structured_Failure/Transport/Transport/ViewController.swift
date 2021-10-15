//
//  ViewController.swift
//  Transport
//
//  Created by Ed Ford on 7/8/21.
//

import Cocoa
import InfrastructureKit
import ModelKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let models = ModelCollection()
        print("I like models, here's my collection: \(models)")        
        print("What goes on the \(TransportSurface.runway)?")
    }
}

