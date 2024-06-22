//
//  TheAudioRecorder.swift
//  Sonharium
//
//  Created by Gilberto Neto on 20/06/24.
//

import SwiftUI
import Foundation
import AVFoundation
import Combine

class AudioRecorder: ObservableObject {
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Falha ao gravar seu áudio")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFileName = docPath.appendingPathComponent("\(dateFormatter.string(from: Date())) Dream.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderBitRateKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            audioRecorder.record()
            recording = true
        } catch {
            print("Não foi possível iniciar a gravação")
        }
    }
    func stopRecording() {
        audioRecorder.stop()
        recording = false
    }
}
