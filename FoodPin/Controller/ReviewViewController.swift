//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtoms: [UIButton]!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
        
        // blur the image
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)

        // make the buttom invisible
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0
        )
        
        for rateButton in rateButtoms {
            rateButton.transform = moveRightTransform
            rateButton.alpha = 0
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        //without delay
//        UIView.animate(withDuration: 2.0) {
//            for rateButton in self.rateButtoms {
//                rateButton.transform = .identity // same as the original
//                rateButton.alpha = 1.0
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        //with delay
        for index in 0...4 {
            UIView.animate(withDuration: 0.4, delay: 0.1+0.05*Double(index), options: [], animations:
                {
                    self.rateButtoms[index].alpha = 1.0
                    self.rateButtoms[index].transform = .identity
            }, completion: nil)
        }
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
