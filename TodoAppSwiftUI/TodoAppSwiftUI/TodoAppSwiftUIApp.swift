//
//  TodoAppSwiftUIApp.swift
//  TodoAppSwiftUI
//
//  Created by Gaurav Semwal on 17/03/25.
//

import SwiftUI

@main
struct TodoAppSwiftUIApp: App {
    @State var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
