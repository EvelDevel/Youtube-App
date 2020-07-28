
//  Created by Евгений Никитин on 28.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        /// Очищаем все поля
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        /// Проверяем есть ли видео
        guard video != nil else {
            return
        }
        
        /// Устанавливаем видео в веб-вью
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        /// Устанавливаем название
        titleLabel.text = video!.title
        
        /// Устанавливаем дату
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        /// Устанавливаем описание
        textView.text = video!.description
    }
}
