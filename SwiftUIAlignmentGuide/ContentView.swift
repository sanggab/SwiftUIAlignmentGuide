//
//  ContentView.swift
//  SwiftUIAlignmentGuide
//
//  Created by Gab on 2023/11/30.
//

import SwiftUI

/// Custom Alignment를 쓰는 이유는 VStack는 HorizentalAlignment(수평정렬)
/// HStack는 VerticalAlignment(수직정렬)만 사용 가능하기에 나는 다른 정렬도 사용하고 싶다면
/// 커스텀으로 구현해서 하면 된다.

extension VerticalAlignment {
    
    private enum KaPPaTextAlignment: AlignmentID {
        
        /// Custom Alignment인 KappaTextAlignment는 기본값이 d[.bottom] 즉
        /// VerticalAlignment의 기본 축인 --- 에서 bottom은 View의 높이 이므로
        /// 축 위에 딱 붙는 형태가 될 것 이다.
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    
    public static let kappaCustomAlignment = VerticalAlignment(KaPPaTextAlignment.self)
}

public struct ContentView: View {
    
    @State private var selectedIndex: Int = 0
    
    private var dayList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    public var body: some View {
        
        
        HStack(alignment: .kappaCustomAlignment) {
            
            /// Image의 alignment은 암시적으로 부모 HStack의 alignment kappaCustomAlignment를 따라간다
            ///  그러면 이놈의 alignment는 defaultValue은 d[.bottom]
            ///  즉 축 위로 붙는 형태
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(dayList.indices, id: \.self) { idx in
                    
                    if selectedIndex == idx {
                        /// 그러면 이제 화살표를 Text랑 정렬로 맞추고 싶으면 어떻게 해야할까
                        /// 일단 내가 선택한 쪽으로 화살표가 가야하니까 선택한 index를 @State로 관측한다.
                        /// 그리고 나서 일치한 경우 alignment를 내가 커스텀한 kappaCustomAlignment를 수정해주면 Image는 암시적으로 kappaCustomAlignment를 따르고 있으므로
                        /// Text의 VerticalAlignment 축을 기준으로 배치해주면 이제 완성된다.
                        Text(dayList[selectedIndex])
                            .alignmentGuide(VerticalAlignment.kappaCustomAlignment) { d in
                                let top = d[.top]
                                let bottom = d[.bottom]

                                print("top -> \(top)")
                                print("bottom -> \(bottom)")

                                return d[.bottom]
                            }
                        
                    } else {
                        Text(dayList[idx])
                            .onTapGesture {
                                withAnimation {
                                    selectedIndex = idx
                                }
                            }
                    }
                    
                }
                
            }
        }
        .padding(20)
        .overlay(Rectangle().stroke(lineWidth: 1))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
