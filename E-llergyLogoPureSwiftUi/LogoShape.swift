//
//  LogoShape.swift
//  E-llergyLogoPureSwiftUi
//
//  Created by Derek Howes on 4/3/23.
//

import Foundation
import SwiftUI
import PureSwiftUI

private extension Shape {
    func demoStyle() -> some View {
        stroke(Color.white, style:demoStrokeStyle)
    }
}

private let logoLayoutGuide = LayoutGuideConfig.grid(columns: 100, rows: 100)
private let bigELayoutGuide = LayoutGuideConfig.grid(columns: 100, rows: 100)

private let demoStrokeStyle = StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round)

struct Logo: Shape {
    var prongNum: Int
    var animatableData: Double
    
    init(prongNum: Int, animating: Bool) {
        self.prongNum = prongNum
        self.animatableData = animating ? 1 : 0
    }
    
    func path(in rect: CGRect) -> Path {
        var grid = logoLayoutGuide.layout(in: rect)
        grid = grid.rotated((120 * prongNum).degrees)
        
        var path = Path()
        let p1 = grid[44, 70]
        let p2 = grid[46, 72]
        
        //        Lead in
        //---------------------
        path.move(p1)
        
        path.curve(
            p2,
            cp1: grid[46, 71],
            cp2: p2,
            showControlPoints: false)
        
        //        Left Tip
        //---------------------
        let line1 = grid[46, 86]
        path.curve(
            line1.to(grid[46, 95], animatableData),
            cp1: line1.to(grid[46, 95], animatableData),
            cp2: line1.to(grid[46, 95], animatableData),
            showControlPoints: false)
        
        let p3 = grid[47, 87]
        path.curve(
            p3.to(grid[46, 96], animatableData),
            cp1: grid[46, 87].to(grid[46, 96], animatableData),
            cp2: grid[47, 87].to(grid[47, 96], animatableData),
            showControlPoints: false)
        
        let line2 = grid[48, 87]
        path.curve(
            line2.to(grid[48, 96], animatableData),
            cp1: line2.to(grid[48, 96], animatableData),
            cp2: line2.to(grid[48, 96], animatableData),
            showControlPoints: false)
        
        let p4 = grid[50, 86]
        path.curve(
            p4.to(grid[50, 95], animatableData),
            cp1: grid[49, 87].to(grid[49, 96], animatableData),
            cp2: grid[50, 87].to(grid[50, 96], animatableData),
            showControlPoints: false)
        
        let line3 = grid[50, 74]
        path.curve(
            line3,
            cp1: line3,
            cp2: line3,
            showControlPoints: false)
        
        //        Middle
        //----------------
        let p5 = grid[51, 74]
        path.curve(
            p5,
            cp1: grid[50, 73],
            cp2: grid[51, 73],
            showControlPoints: false)
        
        //        Right Tip
        //---------------------
        let line4 = grid[51, 86]
        path.curve(
            line4.to(grid[51, 95], 1-animatableData),
            cp1: line4.to(grid[51, 95], 1-animatableData),
            cp2: line4.to(grid[51, 95], 1-animatableData),
            showControlPoints: false)
        
        let p6 = grid[52, 87]
        path.curve(
            p6.to(grid[51, 96], 1-animatableData),
            cp1: grid[51, 87].to(grid[51, 96], 1-animatableData),
            cp2: grid[52, 87].to(grid[52, 96], 1-animatableData),
            showControlPoints: false)
        
        let line5 = grid[53, 87]
        path.curve(
            line5.to(grid[53, 96], 1-animatableData),
            cp1: line5.to(grid[53, 96], 1-animatableData),
            cp2: line5.to(grid[53, 96], 1-animatableData),
            showControlPoints: false)
        
        let p7 = grid[55, 86]
        path.curve(
            p7.to(grid[55, 95], 1-animatableData),
            cp1: grid[55, 87].to(grid[55, 96], 1-animatableData),
            cp2: grid[55, 86].to(grid[55, 95], 1-animatableData),
            showControlPoints: false)
        
        let line6 = grid[55, 72]
        path.curve(
            line6,
            cp1: line6,
            cp2: line6,
            showControlPoints: false)
        
        //        lead out
        //---------------------
        let p8 = grid[57, 70]
        
        path.curve(
            p8,
            cp1: grid[55, 71],
            cp2: p8,
            showControlPoints: false)
        
        // End Box
        //---------------------
        let p9 = grid[57, 66]
        
        path.curve(
            p9,
            cp1: grid[54, 69],
            cp2: p9,
            showControlPoints: false)
        
        let p10 = grid[44, 66]
        
        path.curve(
            p10,
            cp1: grid[50, 65],
            cp2: grid[50, 70],
            showControlPoints: false)

        return path
    }
}


struct topE: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let g = bigELayoutGuide.layout(in: rect)
        
        let p1 = g[20, 42]
        
        path.move(p1)
        
        let p2 = g[17, 38]
        path.curve(p2, cp1: g[15, 42], cp2: p2)
        
        let p3 = g[50, 15]
        path.curve(p3, cp1: g[30, 15], cp2: p3)
        
        let p4 = g[83, 38]
        path.curve(p4, cp1: g[73, 15], cp2: p4)

        let p5 = g[81, 42]
        path.curve(p5, cp1: g[85, 42], cp2: p5)
        
        return path
    }
}

struct bottomE: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let g = bigELayoutGuide.layout(in: rect)
        
        let p1 = g[100, 42]
        
        path.move(p1)
        
        let p2 = g[93, 49]
        path.curve(p2, cp1: g[100, 49], cp2: p2)
        
        let p3 = g[16, 49]
        path.curve(p3, cp1: p3, cp2: p3)
        
        let p4 = g[16, 57]
        path.curve(p4, cp1: g[12, 49], cp2: p4)
        
        let p5 = g[50, 85]
        path.curve(p5, cp1: g[26, 85], cp2: p5)

        let p6 = g[85, 59]
        path.curve(p6, cp1: g[76, 85], cp2: p6)
        
        let p7 = g[86, 57]
        path.curve(p7, cp1: g[93, 49], cp2: p7)
        
        let p8 = g[96, 57]
        path.curve(p8, cp1: p8, cp2: p8)

        let p9 = g[100, 60]
        path.curve(p9, cp1: g[100, 57], cp2: p9)
        
        return path
    }
}
