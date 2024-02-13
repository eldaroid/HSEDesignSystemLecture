//
//  SelectionTabsOfMoodView.swift
//  AppAnalytics
//
//  Created by Попов Эльдар Рустамович on 23.11.2022.
//

import SwiftUI

struct Tabs: Hashable {
    let id: String?
    let title: String
    let current: Bool
    
    static let mockTabsModel = [
        Tabs(id: "1", title: "tab1", current: true),
        Tabs(id: "2", title: "tab2", current: false)
    ]
}

struct SelectionTabsOfMoodView: View {
    let models: [Tabs]
    var colored: Bool? = false
    // MARK: - Just for animated underlining
    @Binding private var currentTab: Int
    @Namespace var namespace
    
    init(
        models: [Tabs],
        colored: Bool? = false,
        selectedIndex: Binding<Int>
    ) {
        self.models = models
        self.colored = colored
        self._currentTab = selectedIndex
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(models.indices, id: \.self) { index in
                    createUnderlineButton(
                        currentTab: $currentTab,
                        namespace: namespace.self,
                        for: index
                    )
                }
            }
        }
    }
    
    private func createUnderlineButton(
        currentTab: Binding<Int>,
        namespace: Namespace.ID,
        for index: Int
    ) -> some View {
        VStack {
            HStack {
                Text(models[index].title)
                    .font(.body)
                    .foregroundColor(currentTab.wrappedValue == index ? .primary : .secondary)
                
                // Task3
                if colored == true {
                    Image("people")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
            }
            .padding(.horizontal, 15)
            
            if currentTab.wrappedValue == index {
                Color.black
                    .frame(height: 2)
                    .matchedGeometryEffect(
                        id: "underline",
                        in: namespace,
                        properties: .frame
                    )
            } else {
                Color.gray.opacity(0.3).frame(height: 1)
            }
        }
        .animation(.spring(response: 0.5), value: self.currentTab)
        .onTapGesture {
            self.currentTab = index
        }
    }
}
