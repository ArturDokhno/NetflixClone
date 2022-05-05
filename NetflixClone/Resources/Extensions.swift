//
//  Extensions.swift
//  NetflixClone
//
//  Created by Артур Дохно on 05.05.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
