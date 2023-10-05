//
//  ListRowView.swift
//  TodoList
//
//  Created by EDSON SANTOS on 05/10/2023.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.square")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This is the first title")
}
