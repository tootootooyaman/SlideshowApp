//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 遠山　哲 on 2020/09/11.
//  Copyright © 2020 tootootooyaman. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var enlarge = ""
    
    @IBOutlet weak var largeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let display = UIImage(named: enlarge)
        largeImageView.image = display
        
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
