//
//  Extension+Image.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/11/20.
//

import Foundation
import SwiftUI

extension Image {
    struct Didik {
        static let MathematicBlue = Image("MathematicBlue")
        static let MathematicDarkBlue = Image("MathematicDarkBlue")
        static let MathematicDarkPink = Image("MathematicDarkPink")
        static let MathematicGreen = Image("MathematicGreen")
        static let MathematicLightBrown = Image("MathematicLightBrown")
        static let MathematicOrange = Image("MathematicOrange")
        static let MathematicPurple = Image("MathematicPurple")
        
        static let Love = Image("Love")
        static let LoveRed = Image("LoveRed")
        static let Bookmark = Image("Bookmark")
        static let Share = Image("Share")
        static let CalendarDays = Image("CalendarDays")

        static func generateRandomDefaultImage(subject: Subject) -> Image {
            var colorVariantDefaultImages = [Image] ()
                
            if (subject == Subject.Mathematic) {
                colorVariantDefaultImages = [MathematicBlue, MathematicDarkBlue, MathematicDarkPink, MathematicGreen, MathematicLightBrown, MathematicOrange, MathematicPurple]
            }
            else {
                colorVariantDefaultImages = [MathematicBlue]
            }
            
            return colorVariantDefaultImages.randomElement()!
        }
    }
}
