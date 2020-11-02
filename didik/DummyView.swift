//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
//
//struct DummyView_Previews: PreviewProvider {
//    static var previews: some View {
//        DummyView()
//    }
//}
//import SwiftUI

var dropdownCornerRadius:CGFloat = 3.0
struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }

    var key: String
    var val: String
}

struct DropdownOptionElement: View {
    var dropdownWidth:CGFloat = 150
    var val: String
    var key: String
    @Binding var selectedKey: String
    @Binding var shouldShowDropdown: Bool
    @Binding var displayText: String

    var body: some View {
        Button(action: {
            self.shouldShowDropdown = false
            self.displayText = self.val
            self.selectedKey = self.key
        }) {
            VStack {
                Text(self.val)
                Divider()
            }

        }.frame(width: dropdownWidth, height: 30)
            .padding(.top, 15).background(Color.gray)

    }
}

struct Dropdown: View {
    var dropdownWidth:CGFloat = 150
    var options: [DropdownOption]
    @Binding var selectedKey: String
    @Binding var shouldShowDropdown: Bool
    @Binding var displayText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                DropdownOptionElement(dropdownWidth: self.dropdownWidth, val: option.val, key: option.key, selectedKey: self.$selectedKey, shouldShowDropdown: self.$shouldShowDropdown, displayText: self.$displayText)
            }
        }

        .background(Color.white)
        .cornerRadius(dropdownCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.primary, lineWidth: 1)
        )
    }
}

struct DropdownButton: View {
    var dropdownWidth:CGFloat = 300
    @State var shouldShowDropdown = false
    @State var displayText: String
    @Binding var selectedKey: String
    var options: [DropdownOption]

    let buttonHeight: CGFloat = 30
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(displayText)
                Spacer()
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
            }
        }
        .padding(.horizontal)
        .cornerRadius(dropdownCornerRadius)
        .frame(width: self.dropdownWidth, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.primary, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight)
                    Dropdown(dropdownWidth: dropdownWidth, options: self.options, selectedKey: self.$selectedKey, shouldShowDropdown: $shouldShowDropdown, displayText: $displayText)
                }
            }, alignment: .topLeading
            )
        .background(
            RoundedRectangle(cornerRadius: dropdownCornerRadius).fill(Color.white)
        )
    }
}



struct DropdownButton_Previews: PreviewProvider {
    static let options = [
        DropdownOption(key: "week", val: "This week"), DropdownOption(key: "month", val: "This month"), DropdownOption(key: "year", val: "This year")
    ]

    static var previews: some View {
        Group {
            VStack(alignment: .leading) {
                DropdownButton(displayText: "This month", selectedKey: .constant("Test"), options: options)
                Text("APAAN")
                Text("List 1")

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            .foregroundColor(Color.primary)

            VStack(alignment: .leading) {

                DropdownButton(shouldShowDropdown: true, displayText: "This month", selectedKey: .constant("Test"), options: options)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
            .foregroundColor(Color.primary)
        }
    }
}
