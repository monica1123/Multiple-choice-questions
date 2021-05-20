//
//  ViewController.swift
//  Multiple choice questions
//
//  Created by Monica Lo on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var allOptionButton: [UIButton]!
    
    @IBOutlet weak var rainbowImage: UIImageView!
    @IBOutlet weak var OImage: UIImageView!
    @IBOutlet weak var XImage: UIImageView!
   
    var index = 0
    var score = 0
    var rightAnswer = ""
    
    var questionsDetail = [Question(question: "誰還沒得過武漢肺炎", option: ["內野聖陽","阿部貞夫","長谷川博己","武田真治"], answer: "長谷川博己"),
                           Question(question: "誰不曾是老菸槍", option: ["北川景子","深田恭子","蒼井優","榮倉奈奈"], answer: "深田恭子"),
                           Question(question: "誰還不是最愛主持人Top1", option: ["有吉弘行","明石家秋刀魚","貴婦松子","塔摩利"], answer: "有吉弘行"),
                           Question(question: "誰得過日本奧斯卡影帝", option: ["竹中直人","豐川悅司","柄本明","織田裕二"], answer: "柄本明"),
                           Question(question: "誰當小三沒修成正果", option: ["岡田准一","篠原涼子","安達祐實","中谷美紀"], answer: "中谷美紀"),
                           Question(question: "誰的另一半不是圈內人", option: ["速水茂虎道","西島秀俊","生田斗真","戶田惠梨香"], answer: "西島秀俊"),
                           Question(question: "誰結婚證券交易所系統故障", option: ["堀北真希","新垣結衣","石原里美","福山雅治"], answer: "石原里美"),
                           Question(question: "誰不曾因吸毒被捕", option: ["田口淳之介","山下智久","澤尻英龍華","伊勢谷友介"], answer: "山下智久"),
                           Question(question: "誰不是歌舞伎演員", option: ["市川猿之助","野村萬齋","香川照之","松本幸四郎"], answer: "野村萬齋"),
                           Question(question: "誰不是出身歌舞伎世家", option: ["中村七之助","市川海老藏","尾上松也","片岡愛之助"], answer: "片岡愛之助"),
                           Question(question: "誰不是出身寶塚歌劇團", option: ["涼","黑木瞳","天海祐希","檀麗"], answer: "涼"),
                           Question(question: "誰兄弟姊妹沒在圈內發展", option: ["永山絢斗","真榮田鄉敦","松田翔太","山崎弘也"], answer: "山崎弘也"),
                           Question(question: "誰沒主持過紅白", option: ["相葉雅紀","二宮和也","大野智","櫻井翔"], answer: "大野智"),
                           Question(question: "誰沒進過傑尼斯", option: ["反町隆史","Taka(one ok rock)","犬飼貴丈","本木雅弘"], answer: "犬飼貴丈"),
                           Question(question: "誰還不是殿堂級國寶美男", option: ["新田真劍佑","平野紫耀","吉澤亮","山崎賢人"], answer: "新田真劍佑"),
                           Question(question: "誰沒被寫入學校音樂教材", option: ["坂井泉水","安室奈美惠","初音未來","SMAP"], answer: "安室奈美惠"),
                           Question(question: "誰不是同間經紀公司", option: ["福山雅治","仲里依紗","吉澤亮","橫濱流星"], answer: "橫濱流星"),
                           Question(question: "誰沒演銀魂真人版電影", option: ["小栗旬","吉澤亮","柳樂優彌","佐藤健"], answer: "佐藤健"),
                           Question(question: "誰不曾當過偶像", option: ["橋本環奈","大島優子","濱邊美波","白石麻衣"], answer: "濱邊美波"),
                           Question(question: "誰和菅田將暉同個經紀人", option: ["杉野遙亮","松坂桃李","中村倫也","山崎賢人"], answer: "松坂桃李")]
    
    func play() {
        numberLabel.text = "\(index + 1)"
        questionLabel.text = questionsDetail[index].question
        rightAnswer = questionsDetail[index].answer
        questionsDetail[index].option.shuffle()
        for i in 0...3 {
            allOptionButton[i].setTitle(questionsDetail[index].option[i], for: .normal)
        }
    }
    
    func startOver(){
        index = 0
        score = 0
        numberLabel.text = "1"
        scoreLabel.text = "0/100"
        rainbowImage.isHidden = false
        OImage.isHidden = true
        XImage.isHidden = true
        questionsDetail.shuffle()
        play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsDetail.shuffle()
        play()
    }
    
    @IBAction func pressAnswer(_ sender: UIButton) {
        index += 1
        
        if sender.currentTitle == rightAnswer{
           score += 10
           scoreLabel.text = "\(score)/100"
            OImage.isHidden = false
            XImage.isHidden = true
            rainbowImage.isHidden = true
        } else {
            XImage.isHidden = false
            OImage.isHidden = true
            rainbowImage.isHidden = true
        }
        
        if index < 10{
           play()
        } else {
            let controller = UIAlertController(title: "遊戲結束", message: "總得分: \(score)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "再挑戰一次", style: .default) { (_) in
                self.startOver()
            }
            controller.addAction(okAction)
            let cancelAction = UIAlertAction(title: "不玩了", style: .cancel, handler: nil)
            controller.addAction(cancelAction)
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        startOver()
    }
}

