//
//  question.swift
//  translateEmoji
//
//  Created by 林奇杰 on 2020/3/21.
//  Copyright © 2020 林奇杰. All rights reserved.
//

import Foundation
import UIKit
class question {
    var imageAttributeStr:String!
    var imageSrc:String!
    var imageObj:NSTextAttachment = NSTextAttachment()
    
    init(imageAttributeStr:String , imageSrc:String){
        self.imageSrc = imageSrc
        self.imageAttributeStr = imageAttributeStr
    }
    
    func getNS()->NSTextAttachment{
        imageObj.image = UIImage(named: imageSrc)
        return imageObj 
    }
}
