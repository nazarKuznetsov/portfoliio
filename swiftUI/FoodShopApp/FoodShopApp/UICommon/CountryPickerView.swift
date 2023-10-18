//
//  CountryPickerView.swift
//  FoodShopApp
//
//  Created by Admin on 18.10.2023.
//

import SwiftUI
import CountryPicker

struct CountryPickerView: UIViewControllerRepresentable {
     
    @Binding var country: Country?
    
    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPickerView
        
        init(parent: CountryPickerView) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "LV"
        countryPicker.delegate = context.coordinator
        
        return countryPicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
}

