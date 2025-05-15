//
//  CameraViewModel.swift
//  ShopSight
//
//  Created by Eric Wang on 5/14/25.
//
import UIKit
import AVFoundation
import CoreImage

class CameraViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var segmentedImage: UIImage?

    private let session = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private let context = CIContext()

    override init() {
        super.init()
        configureSession()
    }

    func configureSession() {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else { return }

        session.beginConfiguration()
        if session.canAddInput(input) { session.addInput(input) }
        if session.canAddOutput(videoOutput) {
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            session.addOutput(videoOutput)
        }
        session.commitConfiguration()
        session.startRunning()
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Run segmentation here (see step 2)
    }

    func getSession() -> AVCaptureSession {
        return session
    }
}
