
//  Created by Евгений Никитин on 28.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        /// Убеждаемся что у нас точно есть видео
        guard self.video != nil else {
            return
        }
        
        /// Устанавливаем название видео
        self.titleLabel.text = video?.title
        
        /// Устанавливаем дату
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        /// Проверяем кэш прежде чем качать из интернета
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            /// Устанавливаем изображение из кэша
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        /// Устанавливаем картинку (превью) из интернета (если она еще не хранится в кэше)
        guard self.video!.thumbnail != "" else {
            return
        }
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        
        /// Создаем изображение по ссылке и устанавливаем его
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                /// Загружаем скачанную фотографию в кэш
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                /// Защита от переиспользования ячеек (чтобы превьюшки не путались)
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        /// Запускаем установку изображения
        dataTask.resume()
    }

}
