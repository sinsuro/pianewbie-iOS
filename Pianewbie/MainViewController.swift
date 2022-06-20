//
//  MainViewController.swift
//  Pianewbie
//
//  Created by 한태희 on 2022/03/22.
//

import UIKit
import AudioKit
import AudioKitUI

class MainViewController: UIViewController, PianoKeyboardDelegate {

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
    
//    var keyboard : KeyboardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        keyboard.octave = Int(48)
//        keyboard.numberOfKeys = Int(60)
        self.initKey(numofKeys: 60, numofOctave: 48)

        API_loadMusic(completion: {sucess, datasheet in
            if sucess {
                self.musicTitle.text = datasheet.info!.musicTitle! + " - " +  datasheet.info!.musicArtist!
            }
        }
        )
        
//        keyboard = KeyboardView.init(width: 3600, height: 200, firstOctave: 1, octaveCount: 11, polyphonic: false)
//        keyboard.prepareForInterfaceBuilder()
//        keyboard.draw(CGRect(x: 0, y: 0, width: 3600, height: 200))
//        keyboard.polyphonicMode = true
        
    
        
//        self.KeyboardScrollView.addSubview(keyboard)
//        self.KeyboardScrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//
//        let minikeyboard = KeyboardView.init(width: 600, height: 110, firstOctave: 1, octaveCount: 11, polyphonic: false)
//        minikeyboard.prepareForInterfaceBuilder()
////        minikeyboard.draw(CGRect(x: 0, y: 0, width: 110, height: 100))
//
//        self.MiniKeyboardView.addSubview(minikeyboard)
//        self.MiniKeyboardView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
////        self.MiniKeyboardView.addSubview(keyboard)
//
//        minikeyboard.programmaticNoteOn(3)
        
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
        
        
        //
        
        demo = Demo(keyboard: keyboard)
        keyboard.delegate = self

        keyNumberLabel.text = String(Int(keyNumberStepper.value))
        keyNumberLabel.accessibilityIdentifier = "keyNumberLabel"

        keyNumberStepper.layer.cornerRadius = 8.0
        keyNumberStepper.layer.masksToBounds = true
        keyNumberStepper.value = Double(keyboard.numberOfKeys)
        keyNumberStepper.accessibilityIdentifier = "keyNumberStepper"
        keyNumberStepper.isAccessibilityElement = true

        octaveLabel.text = String(Int(octaveStepper.value))
        octaveLabel.accessibilityIdentifier = "octaveLabel"

        octaveStepper.layer.cornerRadius = 8.0
        octaveStepper.layer.masksToBounds = true
        octaveStepper.accessibilityIdentifier = "octaveStepper"
        octaveStepper.isAccessibilityElement = true

        showNotesSwitch.subviews[0].subviews[0].backgroundColor = .gray
        showNotesSwitch.accessibilityIdentifier = "showNotesSwitch"
        showNotesSwitch.isAccessibilityElement = true

        latchSwitch.subviews[0].subviews[0].backgroundColor = .gray
        latchSwitch.accessibilityIdentifier = "latchSwitch"
        latchSwitch.isAccessibilityElement = true

        audioEngine.start()
        
    }
    @IBAction func muteToggleAction(_ sender: Any) {
//        if self.isMuted {
//            audioEngine.start()
//            self.isMuted = false
//        } else {
//            audioEngine.stop()
//            self.isMuted = true
//        }
    }
    
    @IBAction func SliderResponser(_ sender: Any) {
        let scrollPoint = CGPoint(x: Int(ScrollSlider.value) * 120 / 10, y: 0)
        KeyboardScrollView.setContentOffset(scrollPoint, animated: false)
        let miniX = self.MiniKeyboardView.frame.origin.x
//        let miniPoint = CGPoint(x: Int(ScrollSlider.value) * 60 / 10 + Int(miniX), y: 0)
//        MiniKeyboardHighlight.center = miniPoint
//        self.highlightMini.frame = CGRect(x: Int(miniX), y: 0, width: 20, height: 20)
    }
    
    @IBOutlet private var fascia: FasciaView!
    @IBOutlet private var keyboard: PianoKeyboard!
    @IBOutlet private var keyNumberStepper: UIStepper!
    @IBOutlet private var keyNumberLabel: UILabel!
    @IBOutlet private var octaveStepper: UIStepper!
    @IBOutlet private var octaveLabel: UILabel!
    @IBOutlet private var showNotesSwitch: UISwitch!
    @IBOutlet private var latchSwitch: UISwitch!

    private let audioEngine = AudioEngine()
    private var demo: Demo?
    private var isMuted : Bool = true

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//         demo?.notes()
//        demo?.chords()
        
    }
    
    private var playPoint : Int = 0
    private var isPlaying : Bool = false
    
    @IBAction func playBtn(_ sender: Any) {
        if isPlaying {
            //pause
        } else {
            demo?.myPlay(playPoint: self.playPoint)
        }
    }
    
    
    
    @IBAction func latchTapped(_ sender: Any) {
        keyboard.toggleLatch()
    }

    @IBAction func showNotesTapped(_: Any) {
        keyboard.toggleShowNotes()
    }

    @IBAction func keyNumberStepperTapped(_ sender: UIStepper) {
        keyboard.numberOfKeys = Int(sender.value)
        keyNumberLabel.text = String(Int(keyNumberStepper.value))
    }

    @IBAction func octaveStepperTapped(_ sender: UIStepper) {
        keyboard.octave = Int(sender.value)
        octaveLabel.text = String(Int(keyboard.octave))
    }
    
    func initKey(numofKeys: Int, numofOctave: Int){
        keyboard.numberOfKeys = numofKeys
        keyNumberLabel.text = String(numofKeys)
        keyboard.octave = numofOctave
        octaveLabel.text = String(numofOctave)
    }
}

extension MainViewController {
    func pianoKeyDown(_ keyNumber: Int) {
        audioEngine.sampler.startNote(UInt8(keyboard.octave + keyNumber), withVelocity: 64, onChannel: 0)
    }

    func pianoKeyUp(_ keyNumber: Int) {
        audioEngine.sampler.stopNote(UInt8(keyboard.octave + keyNumber), onChannel: 0)
    }
}
