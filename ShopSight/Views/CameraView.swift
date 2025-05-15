//
//  CameraView.swift
//  ShopSight
//
//  Created by Eric Wang on 5/14/25.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var viewModel = CameraViewModel()

    var body: some View {
        ZStack {
            CameraPreview(session: viewModel.getSession())
                .edgesIgnoringSafeArea(.all)

            if let image = viewModel.segmentedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
