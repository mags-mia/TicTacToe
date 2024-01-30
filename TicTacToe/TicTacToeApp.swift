//
//  TicTacToeApp.swift, the entry point of the SwiftUI application
//  TicTacToe
//
//  Created by null on 05/09/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TicTacToeApp: App {
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    let viewModel = ViewModel()     //initializes a ViewModel and a TicTacToeModel
    let ticTacToe: TicTacToeModel
    
    init() {
        self.ticTacToe = TicTacToeModel(viewModel: viewModel)   //injects them into the ContentView. initializes the game when the app starts.
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel, ticTacToe: ticTacToe)
            NavigationView {
                    //ContentView()
                  }
        }
    }
}
