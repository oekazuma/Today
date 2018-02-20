//
//  ViewController.swift
//  Today
//
//  Created by 大江和摩 on 2017/06/09.
//  Copyright © 2017年 HAL. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    

    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var WeekLabel: UILabel!
   
    @IBOutlet weak var WaLabel: UILabel!
    
    @IBOutlet weak var EtoLabel: UILabel!
   
   
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //年月日
        let date = NSDate()
        
        let format = DateFormatter()
        format.dateFormat = "yyyy年MM月dd日"
        
        let strDate = format.string(from: date as Date)
        
       
        DateLabel.text = strDate
        
        //曜日
        var calendar = Calendar.current
        
        let weekday = calendar.component(.weekday, from: date as Date)
        
        calendar.locale = Locale(identifier: "ja_JP")
        
        let week = calendar.standaloneWeekdaySymbols[weekday - 1]
   
        WeekLabel.text = week
        
        //和暦
        let f = DateFormatter()
        
        f.locale = Locale(identifier: "ja")
        
        f.calendar = Calendar(identifier: .japanese)
        
        f.dateFormat = "Gy年"
        let wareki = f.string(from: date as Date)
        
        WaLabel.text = wareki
        
        
        //干支
        let year = calendar.component(.year, from: date as Date)
        
        let tgt:Int = year
        
        let eto = ["申🐵", "酉🐔", "戌🐶",  "亥🐗", "子🐭", "丑🐮", "寅🐯", "卯🐰", "辰🐲", "巳🐍", "午🐴", "未🐑"]
        
        let toeto:String = eto[tgt % 12]
        
        EtoLabel.text = toeto
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tweet(_ sender: Any) {
        // SLComposeViewControllerの変数を宣言する
        var composeView:SLComposeViewController
        
        // インスタンス生成時に引数を定数SLServiceTypeTwitterに設定するとTwitterでつぶやけます
        composeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        // 最初に表示するテキストを設定
        let text = "西暦:" + DateLabel.text! + "\n和暦:" + WaLabel.text! + "\n曜日:" + WeekLabel.text! + "\n干支:" + EtoLabel.text!
        
        composeView.setInitialText(text)
     
        // Twitterでつぶやく画面を表示する
        self.present(composeView, animated: true, completion: nil)
    }
    
   


}

