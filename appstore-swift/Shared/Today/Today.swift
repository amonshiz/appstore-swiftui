//
//  Today.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct Today: View {
  var body: some View {
    GeometryReader { geo in
      ScrollView(.vertical) {
        HStack {
          TodayDateHeader()
          Spacer()
        }
        TodayHeader(trailingContent: Text("Header"))
        Divider()
        TodayGrid(within: geo.size.width, contents: Array(repeating: "Today", count: 6))

        Divider()
        MoreStoriesForYouHeader()
        ForEach(0 ..< 3) { _ in
          TodayGrid(within: geo.size.width, contents: Array(repeating: "Placeholder", count: 6))
        }
        Text("Buttons Section")
        Divider()
        Text("Terms & Conditions >")
      }
    }
    .padding([.top, .bottom])
    .padding([.leading, .trailing], 51)
  }
}

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
      .previewLayout()
  }
}
