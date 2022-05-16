//
//  MainViewController.swift
//  Pianewbie
//
//  Created by 한태희 on 2022/03/22.
//

import UIKit
import AudioKit
import AudioKitUI

class MainViewController: UIViewController {

    @IBOutlet weak var KeyboardScrollView: UIScrollView!
    @IBOutlet weak var KeyboardContentView: UIView!
    @IBOutlet weak var ScrollSlider: UISlider!
    @IBOutlet weak var TopSheetView: UIImageView!
    @IBOutlet weak var BottomSheetView: UIImageView!
    @IBOutlet weak var MIDIContollerView: UIView!
    @IBOutlet weak var SheetBackground: UIView!
    @IBOutlet weak var HighlightSection: UIView!
    @IBOutlet weak var MiniKeyboardView: UIView!
    @IBOutlet weak var MiniKeyboardHighlight: UIView!
    
    @IBOutlet weak var musicTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        API_loadMusic(completion: {sucess, datasheet in
            if sucess {
                self.musicTitle.text = datasheet.info!.musicTitle! + " - " +  datasheet.info!.musicArtist!
            }
        }
        )
        
        let keyboard = KeyboardView.init(width: 3600, height: 200, firstOctave: 1, octaveCount: 11, polyphonic: false)
        keyboard.prepareForInterfaceBuilder()
        keyboard.draw(CGRect(x: 0, y: 0, width: 3600, height: 200))
        
        self.KeyboardScrollView.addSubview(keyboard)
        self.KeyboardScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let minikeyboard = KeyboardView.init(width: 600, height: 110, firstOctave: 1, octaveCount: 11, polyphonic: false)
        minikeyboard.prepareForInterfaceBuilder()
//        minikeyboard.draw(CGRect(x: 0, y: 0, width: 110, height: 100))
        
        self.MiniKeyboardView.addSubview(minikeyboard)
        self.MiniKeyboardView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.MiniKeyboardView.addSubview(keyboard)
        
        self.SheetBackground.layer.cornerRadius = 15
        self.SheetBackground.layer.shadowColor = UIColor.gray.cgColor
        self.SheetBackground.layer.shadowRadius = 15
        self.SheetBackground.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.SheetBackground.layer.shadowOpacity = 0.2
        
        self.MIDIContollerView.layer.cornerRadius = 15
        self.MIDIContollerView.layer.shadowColor = UIColor.gray.cgColor
        self.MIDIContollerView.layer.shadowRadius = 15
        self.MIDIContollerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.MIDIContollerView.layer.shadowOpacity = 0.2
        
        self.HighlightSection.layer.cornerRadius = 30
        
//        self.KeyboardScrollView.layer.cornerRadius = 15
//        self.KeyboardScrollView.layer.shadowColor = UIColor.gray.cgColor
//        self.KeyboardScrollView.layer.shadowRadius = 15
//        self.KeyboardScrollView.layer.shadowOffset = CGSize(width: 0, height: 10)
//        self.KeyboardScrollView.layer.shadowOpacity = 0.2
        var highlightMini = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 120))
        self.view.addSubview(highlightMini)
        
        
        
    }

    @IBAction func SliderResponser(_ sender: Any) {
        let scrollPoint = CGPoint(x: Int(ScrollSlider.value) * 120 / 10, y: 0)
        KeyboardScrollView.setContentOffset(scrollPoint, animated: false)
        let miniX = self.MiniKeyboardView.frame.origin.x
//        let miniPoint = CGPoint(x: Int(ScrollSlider.value) * 60 / 10 + Int(miniX), y: 0)
//        MiniKeyboardHighlight.center = miniPoint
//        self.highlightMini.frame = CGRect(x: Int(miniX), y: 0, width: 20, height: 20)
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
