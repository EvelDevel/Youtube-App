
//  Created by Евгений Никитин on 28.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        /// Собираем все в словарь по ключу (url)
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        /// Возвращаем дату, если по этому ключу есть информация
        /// В обратном случае просто вернется nil
        return cache[url]
    }
}
