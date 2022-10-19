//
//  MainMenuMen.swift
//  TrendyolClone
//
//  Created by Macbook Air on 18.10.2022.
//

import Foundation
import UIKit

class MainMenuMan{
    
    var images = ["ERKEK","KADIN"]
    static var imageName = "ERKEK"
    
    
    @objc func changeTheImage(){
        if MainMenuMan.imageName == "ERKEK" {
            MainMenuMan.imageName = "KADIN"
        }else{
            MainMenuMan.imageName = "ERKEK"
        }
        
        
    }
    
    
    static func MainMenuMann() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        let image = UIImageView(frame: CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height*0.3))
        image.image = UIImage(named: imageName)
        view.addSubview(image)
        
        
        return view
    }
}




