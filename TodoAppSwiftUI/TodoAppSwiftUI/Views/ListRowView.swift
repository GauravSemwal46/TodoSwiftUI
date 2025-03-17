//
//  ListRowView.swift
//  TodoAppSwiftUI
//
//  Created by Gaurav Semwal on 17/03/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

#Preview {
    var item1 = ItemModel(title: "Item 1", isCompleted: true)
    var item2 = ItemModel(title: "Item 1", isCompleted: true)
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
