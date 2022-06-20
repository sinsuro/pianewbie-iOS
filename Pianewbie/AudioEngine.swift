import UIKit
import AVFoundation

class AudioEngine {
    private let engine = AVAudioEngine()
    private(set) var sampler = AVAudioUnitSampler()
    private let reverb = AVAudioUnitReverb()
    private let delay = AVAudioUnitDelay()

    func start() {
        engine.attach(sampler)
        engine.attach(reverb)
        engine.attach(delay)

        engine.connect(sampler, to: engine.mainMixerNode, format: nil)
//        engine.connect(sampler, to: delay, format: nil)
//        engine.connect(delay, to: reverb, format: nil)
//        engine.connect(reverb, to: engine.mainMixerNode, format: nil)
//
//        // Reverb
//        reverb.loadFactoryPreset(.smallRoom)
//        reverb.wetDryMix = 0.0
//
//        // Delay
//        delay.wetDryMix = 0.0
//        delay.delayTime = 0.0
//        delay.feedback = 0.0
//        delay.lowPassCutoff = 0.0

//        let audioSession = AVAudioSession.sharedInstance()
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback)
//        } catch {
//            print("Error: AudioSession couldn't set category")
//        }
//
//        do {
//            try audioSession.setActive(true)
//        } catch {
//            print("Error: AudioSession couldn't set category active")
//        }

        if engine.isRunning {
            print("Audio engine already running")
            return
        }

        do {
            try engine.start()
            print("Audio engine started")
        } catch {
            print("Error: couldn't start audio engine")
            return
        }
    }
   
}
