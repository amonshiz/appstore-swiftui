//
//  TodayGrid.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct TodayGrid: View {
  let pattern1 = [
    GridItem(.fixed(450)),
    GridItem(.adaptive(minimum: 200, maximum: 300)),
  ]
  let pattern2 = [
    GridItem(.adaptive(minimum: 200, maximum: 300)),
    GridItem(.fixed(450)),
    GridItem(.adaptive(minimum: 200, maximum: 300)),
  ]

  var body: some View {
    VStack {
      LazyVGrid(columns: pattern1) {
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
      }

      LazyVGrid(columns: pattern2) {
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
        Text("Placeholder")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .border(Color.black)
      }
    }
  }
}

struct TodayGrid_Previews: PreviewProvider {
  static var previews: some View {
    TodayGrid()
      .previewLayout()
  }
}
