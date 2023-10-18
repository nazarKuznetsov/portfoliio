//
//  CountryPickerView.swift
//  FoodShopApp
//
//  Created by Admin on 18.10.2023.
//

import SwiftUI
import CountryPicker

struct CountryPickerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CountryPickerViewController

    let countryPicker = CountryPickerViewController()

    @Binding var country: Country?

    func makeUIViewController(context: Context) -> CountryPickerViewController {
        countryPicker.selectedCountry = "TR"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }

    func updateUIViewController(_ uiViewController: CountryPickerViewController, context: Context) {
        //
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPickerView
        init(_ parent: CountryPickerView) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}

