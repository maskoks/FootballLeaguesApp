//
//  SeasonPicker.swift
//  FootballLeaguesApp
//
//  Created by Жеребцов Данил on 31.07.2022.
//

import UIKit

final class SeasonPicker: UIView {
    let model: Model

    private let picker = UIPickerView()

    required init(model: Model) {
        self.model = model
        super.init(frame: .zero)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = .systemBackground
        if let selectdIndex = model.pickerData.firstIndex(where: {$0.year == model.selectedSeason.year}) {
            picker.selectRow(selectdIndex, inComponent: 0, animated: false)
        }
        addSubview(picker)

        let toolBar = configureToolbar()
        addSubview(toolBar)
        picker.translatesAutoresizingMaskIntoConstraints = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolBar.heightAnchor.constraint(equalToConstant: 44),
            toolBar.topAnchor.constraint(equalTo: topAnchor),
            toolBar.leftAnchor.constraint(equalTo: leftAnchor),
            toolBar.rightAnchor.constraint(equalTo: rightAnchor),
            picker.leftAnchor.constraint(equalTo: leftAnchor),
            picker.rightAnchor.constraint(equalTo: rightAnchor),
            picker.bottomAnchor.constraint(equalTo: bottomAnchor),
            picker.topAnchor.constraint(equalTo: toolBar.bottomAnchor),
        ])
    }

    private func configureToolbar() -> UIToolbar {
        let pickerToolbar = UIToolbar(frame: .zero)

        pickerToolbar.barStyle = .default
        pickerToolbar.barTintColor = .systemGray6


        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnClicked(_:)))
        cancelButton.tintColor = .black
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        doneButton.tintColor = .black

        pickerToolbar.items = [cancelButton, flexSpace, doneButton]
        return pickerToolbar
    }

    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        model.cancelCallbackAction?()
    }

    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        model.doneCallbackAction?(model.pickerData[picker.selectedRow(inComponent: 0)])
    }
}

// MARK: - PickerView
extension SeasonPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let season = model.pickerData[row]
        if let startDate = DateHelper.dateFromJSON(date: season.startDate),
           let endDate = DateHelper.dateFromJSON(date: season.endDate) {
            return DateHelper.configureSeasonYears(from: startDate, to: endDate)
        } else {
            return String(season.year)
        }
    }
}
