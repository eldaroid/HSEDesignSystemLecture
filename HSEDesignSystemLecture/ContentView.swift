//
//  ContentView.swift
//  HSEDesignSystemLecture
//
//  Created by Эльдар Попов on 13.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    var body: some View {
        VStack {
            // Task1
            SelectionTabsOfMoodView(models: Tabs.mockTabsModel, selectedIndex: $selectedIndex)
            
            // Task2
            SelectionTabsOfMoodView(models: Tabs.mockTabsModel, colored: true, selectedIndex: $selectedIndex)
            
            // Task2
//            SoftUITogglesExample()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
