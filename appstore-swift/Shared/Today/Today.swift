//
//  Today.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct Today: View {
  var body: some View {
    ScrollView(.vertical) {
      HStack {
        TodayDateHeader()
        Spacer()
      }
      TodayHeader(trailingContent: Text("Header"))
      Divider()
      TodayGrid(within: 768, contents: Array(repeating: "Today", count: 6))

      Divider()
      MoreStoriesForYouHeader()
      ForEach(0 ..< 3) { _ in
        TodayGrid(within: 768, contents: Array(repeating: "Placeholder", count: 6))
      }
      .padding()
      Text("Buttons Section")
      Divider()
      Text("Terms & Conditions >")
    }
    .padding()
  }
}

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
      .previewLayout()
  }
}
