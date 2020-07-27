
//  Created by Евгений Никитин on 27.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        
        /// Получаем основной контейнер и парсим главный объект (массив)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
