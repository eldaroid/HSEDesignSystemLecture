//
//  View+InverseMask.swift
//  HSEDesignSystemLecture
//
//  Created by Эльдар Попов on 13.02.2024.
//

import SwiftUI

extension View {
  func inverseMask<Mask>(_ mask: Mask) -> some View where Mask: View {
    self.mask(mask
      .foregroundColor(.black)
      .background(Color.white)
      .compositingGroup()
      .luminanceToAlpha()
    )
  }
}
