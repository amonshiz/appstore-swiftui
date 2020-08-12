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
      TodayGrid()

      Divider()
        MoreStoriesForYouHeader()
      ForEach(0 ..< 3) { _ in
        TodayGrid()
      }
      Text("Buttons Section")
      Divider()
      Text("Terms & Conditions >")
    }
  }
}

struct Today_Previews: PreviewProvider {
  static var previews: some View {
    Today()
      .previewLayout()
  }
}
