//
//  ViewController.swift
//  InvalidUIHostingLifecycle
//
//  Created by Daniel Griffin on 10/2/21.
//

import UIKit
import SwiftUI

class ViewController: UIHostingController<MainView> {

    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        print("init did of Hosting Controller begin")
        super.init(coder: aDecoder, rootView: MainView())
        print("init is finished")
    }
    
    override func viewDidLoad() {
        print("View did load is called")
        super.viewDidLoad()
        print("View did load is finished")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear is called")
    }
}

struct MainView: View {
        
    var body: some View {
        Text("Let's knock this up a notch!")
    }
}
