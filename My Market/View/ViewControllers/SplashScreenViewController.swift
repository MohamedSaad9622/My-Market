//
//  SplashScreenViewController.swift
//  My Market
//
//  Created by MAC on 26/08/2022.
//

import UIKit
import Lottie


class SplashScreenViewController: UIViewController {

    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = .init(name: "splashScreen")
        animationView?.frame = view.bounds
        view.addSubview(animationView!)
        animationView?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let storyBoard : UIStoryboard = UIStoryboard(name: Constants.products_Storyboard, bundle:nil)
            let homeVC = storyBoard.instantiateViewController(withIdentifier: Constants.tabBar_viewController_id) as! UITabBarController
            homeVC.modalPresentationStyle = .fullScreen
            self.present(homeVC, animated: false, completion: nil)
        }
        
    }
    


}
