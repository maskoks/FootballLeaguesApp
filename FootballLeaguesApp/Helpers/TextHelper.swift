//
//  TextHelper.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 30.07.2022.
//

import Foundation
import UIKit

struct TextHelper {
    static func configure(text: String, color: UIColor, fontSize: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.0
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakMode = .byTruncatingTail

        let attributes: [NSAttributedString.Key : Any] = [.kern: -0.2,
                                                          .paragraphStyle: paragraphStyle,
                                                          .foregroundColor: color,
                                                          .font: UIFont.systemFont(ofSize: fontSize)]

        return NSMutableAttributedString(string: text, attributes: attributes)
    }
}
