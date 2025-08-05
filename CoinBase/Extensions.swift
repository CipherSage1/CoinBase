//
//  Extensions.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import UIKit
import SwiftUI


// MARK: - Font+AppFonts.swift
extension Font {
    
    // MARK: - Heading
    static var headingRegular: Font { .mavenRegular(size: 32) }
    static var headingMedium: Font { .mavenMedium(size: 32) }
    static var headingSemiBold: Font { .mavenSemiBold(size: 32) }
    static var headingBold: Font { .mavenBold(size: 32) }
    static var headingBlack: Font { .mavenBlack(size: 40) }

    // MARK: - Title
    static var titleRegular: Font { .mavenRegular(size: 24) }
    static var titleMedium: Font { .mavenMedium(size: 24) }
    static var titleSemiBold: Font { .mavenSemiBold(size: 24) }
    static var titleBold: Font { .mavenBold(size: 24) }
    static var titleBlack: Font { .mavenBlack(size: 24) }

    // MARK: - Subtitle
    static var subTitleRegular: Font { .mavenRegular(size: 18) }
    static var subTitleMedium: Font { .mavenMedium(size: 18) }
    static var subTitleSemiBold: Font { .mavenSemiBold(size: 18) }
    static var subTitleBold: Font { .mavenBold(size: 18) }
    static var subTitleBlack: Font { .mavenBlack(size: 18) }

    // MARK: - Body
    static var bodyRegular: Font { .mavenRegular(size: 16) }
    static var bodyMedium: Font { .mavenMedium(size: 16) }
    static var bodySemiBold: Font { .mavenSemiBold(size: 16) }
    static var bodyBold: Font { .mavenBold(size: 16) }
    static var bodyBlack: Font { .mavenBlack(size: 16) }

    // MARK: - Caption
    static var captionRegular: Font { .mavenRegular(size: 12) }
    static var captionMedium: Font { .mavenMedium(size: 12) }
    static var captionSemiBold: Font { .mavenSemiBold(size: 12) }
    static var captionBold: Font { .mavenBold(size: 12) }
    static var captionBlack: Font { .mavenBlack(size: 12) }

    // MARK: - Small
    static var smallRegular: Font { .mavenRegular(size: 10) }
    static var smallMedium: Font { .mavenMedium(size: 10) }
    static var smallSemiBold: Font { .mavenSemiBold(size: 10) }
    static var smallBold: Font { .mavenBold(size: 10) }
    static var smallBlack: Font { .mavenBlack(size: 10) }

    // MARK: - Custom Font Creators
    static func mavenRegular(size: CGFloat) -> Font {
        return .custom("MavenPro-Regular", size: size)
    }

    static func mavenMedium(size: CGFloat) -> Font {
        return .custom("MavenPro-Medium", size: size)
    }

    static func mavenSemiBold(size: CGFloat) -> Font {
        return .custom("MavenPro-SemiBold", size: size)
    }

    static func mavenBold(size: CGFloat) -> Font {
        return .custom("MavenPro-Bold", size: size)
    }

    static func mavenBlack(size: CGFloat) -> Font {
        return .custom("MavenPro-Black", size: size)
    }
}



// MARK: - Custom Color Palette for SwiftUI
extension Color {
    static var appAccent: Color {
        Color("Accent", bundle: .main)
    }

    static var appAccentColor: Color {
        Color("AccentColor", bundle: .main)
    }

    static var appPrimary: Color {
        Color("PrimaryColor", bundle: .main)
    }

    static var appSecondary: Color {
        Color("Secondary", bundle: .main)
    }

    static var appDanger: Color {
        Color("Danger", bundle: .main)
    }

    static var appDarkText: Color {
        Color("DarkText", bundle: .main)
    }

    static var appGrayText: Color {
        Color("GrayText", bundle: .main)
    }

    static var appLightGrayText: Color {
        Color("LightGrayText", bundle: .main)
    }

    static var appWhite: Color {
        Color("White", bundle: .main)
    }

    static var appBlack: Color {
        Color("Black", bundle: .main)
    }
    
    static var appTextInputBg: Color {
        Color("TextInputBg", bundle: .main)
    }
}


extension Color {
    init?(hex: String) {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }

        guard hex.count == 6,
              let rgb = Int(hex, radix: 16) else { return nil }

        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255.0,
            green: Double((rgb >> 8) & 0xFF) / 255.0,
            blue: Double(rgb & 0xFF) / 255.0
        )
    }
}
