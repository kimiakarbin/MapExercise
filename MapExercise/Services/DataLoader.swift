//
//  DataLoader.swift
//  MapExercise
//
//  Created by KimiaKarbin on 16/01/26.
//
import Foundation

class DataLoader {
    func loadPins() -> [Pin] {
        if let url = Bundle.main.url(forResource: "pins", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(PinsResponse.self, from: data) {
                    return response.data.pins

                }
            }
            
        }
        return []
    }
}
