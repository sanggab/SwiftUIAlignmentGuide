//
//  TestCode.swift
//  SwiftUIAlignmentGuide
//
//  Created by Gab on 2023/11/30.
//

import SwiftUI

extension HorizontalAlignment {
    private enum GabAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[HorizontalAlignment.trailing]
        }

    }

    static let gabAlignment = HorizontalAlignment(GabAlignment.self)
}

struct TestCode: View {

    @State private var selectedIdx = 1

    private var dayList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    var body: some View {
        VStack(alignment: .gabAlignment) {

            Rectangle()
                .frame(width: 10)
//                .alignmentGuide(.gabAlignment) { d in
//                    return d[.trailing]
//                }

            Rectangle()
                .frame(width: 30, height: 60)
//                .alignmentGuide(.gabAlignment) { d in
//                    return d[HorizontalAlignment.center]
//                }

            Rectangle()
                .frame(width: 10)
//                .alignmentGuide(.gabAlignment) { d in
//                    return d[.trailing]
//                }
        }
    }
}

struct TestCode_Previews: PreviewProvider {
    static var previews: some View {
        TestCode()
    }
}
