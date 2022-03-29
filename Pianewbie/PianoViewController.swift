//
//  PianoViewController.swift
//  Pianewbie
//
//  Created by 한태희 on 2022/03/21.
//

import UIKit
import AudioKit
import AudioKitUI

class PianoViewController: UIViewController {

    @IBOutlet weak var keyboardScrollView: UIView!
    @IBOutlet var Piano: UIView!
    @IBOutlet weak var BackgroundScrollView: UIScrollView!
    
    var scrollRatio : Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboard = KeyboardView.init(width: 3760, height: 200, firstOctave: 3, octaveCount: 11, polyphonic: false)
        keyboard.prepareForInterfaceBuilder()
        keyboard.draw(CGRect(x: 100, y: 600, width: 120, height: 120))
        
//        let k2 = KeyboardView(width: 500, height: 200)
        self.keyboardScrollView.addSubview(keyboard)
        self.keyboardScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.view.addSubview(keyboard)
        
        // Do any additional setup after loading the view.
    }
//
//    func scrollEvent(Value : Float) {
//        let frameWidth : Float = Float(self.view.frame.width)
//        BackgroundScrollView.setContentOffset(CGPoint(x: Int(frameWidth * Value), y: 0), animated: true)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
