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
      Text("Today Section")
      Divider()
      TodayHeader(trailingContent: EmptyView())
      Text("More Stories For You Section")
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
