//
//  PrettyOutput.swift
//  TrySwiftAlgorithm
//
//  Created by BaekSungwook on 2/1/20.
//  Copyright © 2020 BaekSungwook. All rights reserved.
//

import Foundation
enum PrettyOutput {
    static func getFunc(_ funcInfo: String) -> (name: String, params: [String]?)? {
        guard let funcName = funcInfo.split(separator: "(").first,
            let parenthesOpenIndex = funcInfo.firstIndex(of: "("),
            let parenthesCloseIndex = funcInfo.firstIndex(of: ")") else {
            return nil
        }
        let params = funcInfo[funcInfo.index(after: parenthesOpenIndex)..<parenthesCloseIndex]
            .split(separator: ":")
            .map { String($0) }
        return (name: String(funcName), params: params)
    }
}
