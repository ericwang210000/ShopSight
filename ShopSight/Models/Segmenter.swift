//
//  Segmenter.swift
//  ShopSight
//
//  Created by Eric Wang on 5/14/25.
//

import Vision
import UIKit              // For UIImage
import Vision            // For VNCoreMLRequest and related types
import CoreML            // For loading the Core ML model
import CoreImage         // For CIImage and CIContext
import AVFoundation

let model = try! VNCoreMLModel(for: DETRResnet50SemanticSegmentationF16().model)

func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

    let request = VNCoreMLRequest(model: model) { [weak self] req, err in
        guard let results = req.results as? [VNRecognizedObjectObservation],
              let topResult = results.first else { return }

        DispatchQueue.main.async {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let cropped = ciImage.cropped(to: topResult.boundingBox.applyingTo(ciImage.extent))
        }
    }

    let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
    try? handler.perform([request])
}
