//
//  ViewController.swift
//  Youtube-App
//
//  Created by Евгений Никитин on 23.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()
    }
}

