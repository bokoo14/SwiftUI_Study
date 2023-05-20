//
//  JsonDecodeExtension.swift
//  AnimalKR
//
//  Created by Bokyung on 2023/04/24.
//

import Foundation

//JSON 파일을 자동으로 Decode해줌
 
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Json 파일 가져오기
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Json로 부터 Data 생성
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        // 3. Json Decoder 생성
        let decoder = JSONDecoder()
        
        // 4. 만든 decoder를 통해서 Data를 Swift상에서 읽을 수 있게 Decode하기
        guard let loaded = try?decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        // 5. Decode된 data return 하기
        return loaded
    }
}
