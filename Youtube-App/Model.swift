
//  Created by Евгений Никитин on 24.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class Model {
    
    func getVideos() {
        
        // Создаем URL-объект
        let url = URL(string: Constants.API_URL)
        guard url != nil else { return }
        
        // Создаем URLSession-объект
        let session = URLSession.shared
        
        // Получаем data task из URLSession-объекта
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Проверяем на ошибки
            if error != nil || data == nil { return }
            
            do {
                // Парсим дату в видео-объекты
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                print(response)
            }
            catch {
                print("we have problem with parsing items")
            }
        }
        
        // Стартуем задание
        dataTask.resume()
    }
    
}
