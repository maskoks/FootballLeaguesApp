//
//  NavigationClickableView.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 31.07.2022.
//

import UIKit

final class NavigationClickableView: UIButton {

    var title: String? {
        didSet{
            setup()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public var callbackAction: (() -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -8.0)
    }

    func setup() {
        guard let title = title else { return }
        setAttributedTitle(TextHelper.configureBold(text: title, color: .label, fontSize: 18.0), for: .normal)

        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        semanticContentAttribute = .forceRightToLeft
        setImage(UIImage(systemName: "chevron.down"), for: .normal)
        tintColor = .secondaryLabel
    }

    @objc private func didTapButton() {
        callbackAction?()
    }
}
