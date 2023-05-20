//
//  GridBasic.swift
//  iOS16
//
//  Created by Bokyung on 2023/05/17.
//

import SwiftUI

struct GridBasic: View {
    var body: some View {
        VStack (spacing: 20) {
            Grid {
                GridRow {
                    Color.red
                    Color.red
                    Color.red
                }//: GridRow
                GridRow {
                    Color.red
                        .frame(width: 100, height: 100)
                    Color.red
                        .frame(width: 30, height: 30)
                        .gridCellColumns(1)
                        .gridCellAnchor(.center)
                }//: GridRow
            }//: Grid
            .frame(height: 200)
            
            Divider()
            
            Grid {
                GridRow {
                    Color.blue
                        .frame(width: 30, height: 30)
                    Color.blue
                        .frame(width: 30, height: 30)
                    Color.blue
                        .frame(width: 30, height: 30)
                }// :GridRow
                
                GridRow {
                    Color.blue
                        .frame(width: 30, height: 30)
                }// :GridRow
                
            }
        }//: VStack
        .padding()
    }
}

struct GridBasic_Previews: PreviewProvider {
    static var previews: some View {
        GridBasic()
    }
}
