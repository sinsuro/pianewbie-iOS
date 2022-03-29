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

    @IBOutlet weak var tmpScrollView: UIScrollView!
    @IBOutlet weak var tmpView: UIView!
    @IBOutlet weak var ScrollSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let keyboard = KeyboardView.init(width: 3760, height: 200, firstOctave: 1, octaveCount: 11, polyphonic: false)
        keyboard.prepareForInterfaceBuilder()
        keyboard.draw(CGRect(x: 0, y: 0, width: 3760, height: 200))
        
        self.tmpView.addSubview(keyboard)
        self.tmpView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func SliderResponser(_ sender: Any) {
        let scrollPoint = CGPoint(x: Int(ScrollSlider.value)*120/10, y: 0)
        //OR
//        let scrollPoint = CGPoint(x: Int(ScrollSlider.value*tmpView.frame.maxX/10), y: 0)
        tmpScrollView.setContentOffset(scrollPoint, animated: false)

//        KeyboardVC.scrollRatio = ScrollSlider.value
//        KeyboardVC.scrollEvent(Value: ScrollSlider.value)
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
