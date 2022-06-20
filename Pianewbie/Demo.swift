//
//  Demo.swift
//  Example
//
//  Created by Gary Newby on 14/08/2020.
//

import UIKit

class Demo {
    private let keyboard: PianoKeyboard
    private var sequence: Sequence?

    init(keyboard: PianoKeyboard) {
        self.keyboard = keyboard
        setUp()
    }

    private func setUp() {
        // Custom labels
        keyboard.setLabel(for: 60, text: "Do")
        keyboard.setLabel(for: 62, text: "Re")
        keyboard.setLabel(for: 64, text: "Mi")

        for noteNumber in 65...72 {
            keyboard.setLabel(for: noteNumber, text: Note.name(for: noteNumber))
        }

        keyboard.highlightKey(noteNumber: 72, color: UIColor.red.withAlphaComponent(0.7), resets: false)
        keyboard.highlightKey(noteNumber: 75, color: UIColor.red.withAlphaComponent(0.7), resets: false)
        keyboard.highlightKey(noteNumber: 79, color: UIColor.red.withAlphaComponent(0.7), resets: false)
    }
//["C4", "E4", "G4", "B4"],["D4", "F#4", "A4"],["E4", "G4", "B4"],["D4", "F#4", "A4"]
    func chords() {
        autoHighlight(score: [["G4"],["G4"],["A4"],["A4"],["G4"],["G4"],["E4"]
                             ], size: [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0], position: 0, loop: false, tempo: 60.0, play: true)
    }
    
    func myPlay(playPoint: Int = 0) -> Int {
        let delay = 60.0/120.0
//        autoHighlight(score: [["C4"],["D4"],["E4"],["F4"],["G4"],["A4"],["B4"]
//                             ], position: 0, loop: false, tempo: 120.0, play: true)
//        autoHighlight(score: [["C5"],["B4"],["A4"],["G4"],["F4"],["E4"],["D4"]
//                             ], position: 0, loop: false, tempo: 120.0, play: true)
//
//        let tmpMeasure = Measure(accidental: "", changingMeter: "", noteCount: 4, measureMinX: 0.0, measureMinY: 0.0, measureMaxX: 0.0, measureMaxY: 0.0, notes: [do_, rest_])
//
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            self?.autoHighlight(score: [["C4"],["D4"],["E4"],["F4"]
                                       ], size: [4.0, 4.0, 4.0, 4.0], position: 0, loop: false, tempo: 120.0, play: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay*5) { [weak self] in
            self?.autoHighlight(score: [["C5"],["B4"],["A4"],["G4"]
                                 ], size: [4.0, 8.0, 8.0, 2.0], position: 0, loop: false, tempo: 120.0, play: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay*9) { [weak self] in
            self?.autoHighlight(score: [["C5","G4"],["B4"],["A4"],["G4"],["A4"],["G4"],["A4"]
                                       ], size: [4.0, 4.0, 8.0, 8.0, 16.0, 16.0, 16.0, 16.0], position: 0, loop: false, tempo: 120.0, play: true, isLast: true)
            self?.keyboard.reset(didPlay: true)
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
//            self?.autoHighlight(score: [["D4"],["A4"],["A4"]
//                                       ], size: [4.0, 8.0, 8.0], position: 0, loop: false, tempo: 120.0, play: true)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay*3) { [weak self] in
//            self?.autoHighlight(score: [["A4"],["G4"],["E4"],["D4"]
//                                 ], size: [8.0, 8.0, 8.0, 8.0], position: 0, loop: false, tempo: 120.0, play: true)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay*5) { [weak self] in
//            self?.autoHighlight(score: [["A3"],["A3"],["D4"],["E4"]
//                                       ], size: [Double(16/3), 16.0, 8.0, 8.0], position: 0, loop: false, tempo: 120.0, play: true, isLast: true)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay*7) { [weak self] in
//            self?.autoHighlight(score: [["D4"]
//                                       ], size: [2.0], position: 0, loop: false, tempo: 120.0, play: true, isLast: true)
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay*9) { [weak self] in
//
//            self?.keyboard.reset(didPlay: true)
//        }
        
        return playPoint
    }
    func notes() {
        let alpha: CGFloat = 0.7
        sequence = Sequence(delay: 0.2, functions: { self.keyboard.highlightKey(noteNumber: 67, color: UIColor.blue.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 67, color: UIColor.green.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 69, color: UIColor.yellow.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 69, color: UIColor.orange.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 67, color: UIColor.purple.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 67, color: UIColor.red.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 64, color: UIColor.blue.withAlphaComponent(alpha),play: true, resets: true) },{self.keyboard.reset(didPlay: true)},{ self.keyboard.highlightKey(noteNumber: 67, color: UIColor.blue.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 67, color: UIColor.green.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 64, color: UIColor.yellow.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 64, color: UIColor.orange.withAlphaComponent(alpha),play: true, resets: true) }, { self.keyboard.highlightKey(noteNumber: 62, color: UIColor.purple.withAlphaComponent(alpha),play: true, resets: true) },{self.keyboard.highlightKey(noteNumber: 62, color: UIColor.purple.withAlphaComponent(alpha),play: true, resets: true) }, {self.keyboard.reset(didPlay: true)},{self.keyboard.reset(didPlay: true)}
        )
    }

    //[4,4,4,4] -> 한마디 1/4 * 4 = 1
    //[8,8,8,8,8,8,8,8] -> 한마디 1/8 * 8 = 1
    private func autoHighlight(score: [[String]], size: [Double], position: Int, loop: Bool, tempo: Double, play: Bool = false, isLast: Bool = false) {
        keyboard.highlightKeys(noteNames: score[position], color: UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.35), play: play)
        let delay = 60.0/tempo*4
        let nextPosition = position + 1
        if nextPosition < score.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay/size[nextPosition-1]) { [weak self] in
                self?.autoHighlight(score: score, size: size, position: nextPosition, loop: loop, tempo: tempo, play: play)
            }
        } else {
            if loop {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay/size[nextPosition-1]) { [weak self] in
                    self?.autoHighlight(score: score, size: size, position: 0, loop: loop, tempo: tempo, play: play)
                }
            } else if isLast == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay/size[nextPosition-1]) { [weak self] in
                    self?.keyboard.reset(didPlay: play)
                }
            }
        }
    }
}
