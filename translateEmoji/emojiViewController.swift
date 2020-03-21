//
//  emojiViewController.swift
//  translateEmoji
//
//  Created by 林奇杰 on 2020/3/21.
//  Copyright © 2020 林奇杰. All rights reserved.
//

import UIKit

class emojiViewController: UIViewController {
    
    var itemIndex = 0
    var likeItem:[question] = [question]()
    var unlikeItem:[question] = [question]()
    var currentImage:question!
    
    var questionAry:[question] = [question]()
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.font =  questionLabel.font.withSize(30)
        
        questionAry.append(question(imageAttributeStr:"釣魚",imageSrc:"fishing-pole"))
        questionAry.append(question(imageAttributeStr:"踢橄欖球",imageSrc:"american-football"))
        questionAry.append(question(imageAttributeStr:"踢足球",imageSrc:"goal-net"))
        questionAry.append(question(imageAttributeStr:"滑溜冰",imageSrc:"ice-skate"))
        questionAry.append(question(imageAttributeStr:"騎腳踏車",imageSrc:"man-biking"))
        questionAry.append(question(imageAttributeStr:"打籃球",imageSrc:"man-bouncing-ball"))
        questionAry.append(question(imageAttributeStr:"攀岩",imageSrc:"man-climbing"))
        questionAry.append(question(imageAttributeStr:"打高爾夫球",imageSrc:"man-golfing"))
        questionAry.append(question(imageAttributeStr:"水上排球",imageSrc:"man-playing-water-polo"))
        questionAry.append(question(imageAttributeStr:"游泳",imageSrc:"man-swimming"))
        questionAry.append(question(imageAttributeStr:"唱歌",imageSrc:"microphone"))
        questionAry.append(question(imageAttributeStr:"健身",imageSrc:"person-lifting-weights"))
        questionAry.append(question(imageAttributeStr:"打桌球",imageSrc:"ping-pong"))
        questionAry.shuffle()
        
        showQuestion(index:0)
        // Do any additional setup after loading the view.
    }
    
    func showQuestion(index:Int){
        let signAsk = question(imageAttributeStr: "?", imageSrc: "exclamation-question-mark")
        signAsk.getNS().bounds = CGRect(x: 0, y: -5, width: 30, height: 30)
        let content = NSMutableAttributedString(string: "你喜歡")
        if questionAry.count > itemIndex{
            let questionOBj = questionAry[itemIndex]
            currentImage = questionOBj
            content.append(NSAttributedString(attachment:questionOBj.getNS()))
            content.append(NSAttributedString(string: "嗎"))
            content.append(NSAttributedString(attachment:signAsk.getNS()))
            questionLabel.attributedText = content
        }else{
            questionLabel.font =  questionLabel.font.withSize(20)
            questionLabel.numberOfLines = 20
            let content = NSMutableAttributedString(string: "統計結果\n\n")
            for likeObj in likeItem{
                likeObj.getNS().bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
                content.append(NSAttributedString(string:"你喜歡"))
                content.append(NSAttributedString(string:likeObj.imageAttributeStr))
                content.append(NSAttributedString(attachment:likeObj.getNS()))
                content.append(NSAttributedString(string: "\n"))
                questionLabel.attributedText = content
            }
            for unlikeObj in unlikeItem{
               unlikeObj.getNS().bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
               content.append(NSAttributedString(string:"你不喜歡"))
               content.append(NSAttributedString(string:unlikeObj.imageAttributeStr))
               content.append(NSAttributedString(attachment:unlikeObj.getNS()))
               content.append(NSAttributedString(string: "\n"))
               questionLabel.attributedText = content
           }
        }
    }
    
    @IBAction func likeBtn(_ sender: Any) {
        if questionAry.count > itemIndex{
            likeItem.append(currentImage)
            itemIndex = itemIndex + 1
            showQuestion(index:itemIndex)
        }
    }
    
    @IBAction func unlinkBtn(_ sender: Any) {
        if questionAry.count > itemIndex{
            unlikeItem.append(currentImage)
            itemIndex = itemIndex + 1
            showQuestion(index:itemIndex)
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
