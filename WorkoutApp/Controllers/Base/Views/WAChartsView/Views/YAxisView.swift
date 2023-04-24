//
//  XAxisView.swift
//  WorkoutApp
//
//

import UIKit

final class YAxisView: WABaseView {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()

    func configure(with data: [WAChartsView.Data]) {
        ///удаляем входящие колличесвто вью
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        ///заново наполняем лейблами
        (0...9).reversed().forEach {
            let lable = UILabel()
            lable.font = R.Fonts.helvelticaRegular(with: 9)
            lable.textColor = R.Colors.inactive
            lable.textAlignment = .right
            lable.text = "\($0 * 10)" // TODO: - Remake to colculated interval
        ///addArrangedSubview  - добавляем lable на вью
            stackView.addArrangedSubview(lable)
        }
    }
}

extension YAxisView {
    override func setupViews() {
        super.setupViews()

        setupView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}


