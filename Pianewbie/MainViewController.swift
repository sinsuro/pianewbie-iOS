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
    @IBOutlet weak var tmpLabel: UILabel!
    @IBOutlet weak var ScrollSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let keyboard = KeyboardView.init(width: 3760, height: 200, firstOctave: 3, octaveCount: 11, polyphonic: false)
        keyboard.prepareForInterfaceBuilder()
        keyboard.draw(CGRect(x: 100, y: 600, width: 120, height: 120))
        
//        let k2 = KeyboardView(width: 500, height: 200)
        self.tmpView.addSubview(keyboard)
        self.tmpView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tmpLabel.text = String(ScrollSlider.value)
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func SliderResponser(_ sender: Any) {
        tmpLabel.text = String(ScrollSlider.value)
        
        let KeyboardVC = self.storyboard?.instantiateViewController(withIdentifier: "PianoViewController") as! PianoViewController
        
        let scrollPoint = CGPoint(x: Int(ScrollSlider.value)*10, y: 0)
        //OR
        //let bottomOffset = CGPoint(x: 0, y: scrollView.frame.maxY)
        tmpScrollView.setContentOffset(scrollPoint, animated: false)

        
        print(scrollPoint)

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
