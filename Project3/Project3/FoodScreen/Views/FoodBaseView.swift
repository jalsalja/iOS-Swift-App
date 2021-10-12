//
//  BaseView.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import UIKit

@IBDesignable class FoodBaseView: UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    func configure(){
        
    }
}
