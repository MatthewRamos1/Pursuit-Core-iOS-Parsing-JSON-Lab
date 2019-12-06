//
//  Color.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/5/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

struct Color: Decodable {
    let name: String
    let hexString: String
    let rgb: rgb
    
}

struct rgb: Decodable {
    let r: Int
    let g: Int
    let b: Int
}

extension Color {
    
    static func getColors (data: Data) -> [Color] {
         var colors = [Color]()
         do {
            colors = try JSONDecoder().decode([Color].self, from: data)
         } catch {
             fatalError("Can't parse data \(error)")
         }
         return colors
     }
     
     func UIColorMaker () -> UIColor {
         return UIColor(displayP3Red: CGFloat( self.rgb.r / 255), green: CGFloat( self.rgb.g / 255), blue: CGFloat( self.rgb.b / 255), alpha: 1.0)
     
     }
}


