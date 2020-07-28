
//  Created by Евгений Никитин on 23.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Устанавливаем датасорс и делегат для таблицы
        tableView.dataSource = self
        tableView.delegate = self
        /// Устанавливаем делегат для модели видео
        model.delegate = self
        /// Оформляем запрос на получение и парсинг даты
        model.getVideos()
    }
    
    
    // MARK: Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }
    
    
    // MARK: Table View methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        /// Заполняем ячейку информацией
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

