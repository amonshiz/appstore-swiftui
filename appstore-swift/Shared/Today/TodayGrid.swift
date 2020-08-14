//
//  TodayGrid.swift
//  appstore-swift
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct ScreenLayout {
  enum ItemSize {
    case wide
    case narrow
  }

  enum Count {
    case three
    case two
    case one
  }

  struct Spacing {
    let horizontal: CGFloat
    let vertical: CGFloat
  }

  let count: Count
  let narrowSize: CGFloat
  let wideSize: CGFloat
  let spacing: Spacing

  init(for width: CGFloat, narrowSize: CGFloat, spacing: CGFloat) {
    self.narrowSize = narrowSize

    if width - spacing * 4.0 - narrowSize * 2.0 > 335.0 {
      count = .three
    } else if width - spacing * 3.0 - narrowSize > 335.0 {
      count = .two
    } else {
      count = .one
    }

    var finalHorizontalSpacing = spacing
    switch count {
    case .three:
      wideSize = width - spacing * 4.0 - narrowSize * 2.0
    case .two:
      wideSize = width - spacing * 3.0 - narrowSize
    case .one:
      if width * 0.25 > spacing * 2.0 {
        wideSize = width * 0.75
      } else {
        wideSize = width * 0.85
      }
      finalHorizontalSpacing = (width - wideSize) / 2.0
    }

    self.spacing = Spacing(horizontal: finalHorizontalSpacing, vertical: spacing)
  }

  func pattern() -> UnfoldSequence<CGFloat, Int> {
    let p: [ItemSize]
    switch count {
    case .three:
      p = [.wide, .narrow, .narrow, .narrow, .wide, .narrow]
    case .two:
      p = [.wide, .narrow, .narrow, .wide]
    case .one:
      p = [.wide]
    }

    return sequence(state: 0) { state -> CGFloat? in
      let current = state
      state = (state + 1) % p.count

      switch p[current] {
      case .wide:
        return wideSize
      case .narrow:
        return narrowSize
      }
    }
  }
}

let contents = (0..<10).map(String.init(describing:))

let layoutSpacing: CGFloat = 52 // constant
let fixedHeight: CGFloat = 50

struct TodayGrid: View {
  let totalWidth: CGFloat
  let totalHeight: CGFloat
  let positionSize: [(CGSize, CGFloat)]
  let contents: [String]

  init(within width: CGFloat, contents: [String]) {
    self.contents = contents

    totalWidth = width
    let narrowSize: CGFloat = 335
    let layout = ScreenLayout(for: width, narrowSize: narrowSize, spacing: layoutSpacing)
    var pattern = layout.pattern()

    let maxTrailing = width - layout.spacing.horizontal - 2.0 /* slop */

    var pos: [(CGSize, CGFloat)] = []
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0
    for _ in contents {
      guard let s = pattern.next() else { fatalError() }
      xOffset += layout.spacing.horizontal
      pos.append((CGSize(width: xOffset, height: yOffset), s))
      xOffset += s

      if xOffset >= maxTrailing {
        xOffset = 0
        yOffset += fixedHeight + layout.spacing.vertical
      }
    }

    positionSize = pos
    totalHeight = yOffset - layout.spacing.vertical
  }

  var body: some View {
    Color.clear.frame(width:totalWidth, height: totalHeight)
      .overlay(
        ZStack(alignment: .topLeading) {
          ForEach(Array(positionSize.enumerated()), id: \.0) { (index, element) in
            Text("\(contents[index])")
              .frame(width: element.1, height: fixedHeight)
              .border(Color.red)
              .offset(element.0)
              .id(index)
          }
        }, alignment: .topLeading
      )
  }
}

struct TodayGrid_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { geo in
      TodayGrid(within: geo.size.width, contents: Array(repeating: "Placeholder", count: 6))
    }
    .padding([.top])
    .previewLayout()

    GeometryReader { geo in
      TodayGrid(within: geo.size.width, contents: Array(repeating: "Placeholder", count: 6))
    }
    .padding([.top])
    .previewLayout(PreviewLayout.fixed(width: 768, height: 1024))
  }
}
