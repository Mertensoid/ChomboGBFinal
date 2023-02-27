//
//  CamViewController.swift
//  ChomboGBFinal
//
//  Created by Stanislav on 20.02.2023.
//

import UIKit
import AVFoundation

final class CamViewController: UIViewController {

    private lazy var bottomBar = BottomBarView()
    private lazy var topBar = TopBarView()
    private var cameraService: CameraService
    var delegate: PhotoDelegate?

    init(cameraService: CameraService) {
        self.cameraService = cameraService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraService = CameraService()
        cameraService.delegate = self
        checkPermissions()
        setupPreviewLayer()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

// MARK: - UI

    private func setupUI() {
        setupZoomRecognizer()

        view.addSubview(topBar)
        view.addSubview(bottomBar)

        bottomBar.delegate = self

        bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23).isActive = true

        topBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14).isActive = true
    }

    private func setupZoomRecognizer() {
        let zoomRecognizer = UIPinchGestureRecognizer()
        zoomRecognizer.addTarget(self, action: #selector(didPinch(_:)))
        view.addGestureRecognizer(zoomRecognizer)
    }

    private func setupPreviewLayer() {
        view.backgroundColor = ColorConstants.baseBlack
        let previewLayer = AVCaptureVideoPreviewLayer(session: cameraService.captureSession) as AVCaptureVideoPreviewLayer

        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
    }

    
}

// MARK: - Bottom bar delegate

extension CamViewController: BottomBarDelegate {

    func switchCamera() {
        cameraService.switchCameraInput()

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }

    func takePhoto() {
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = topBar.isTorchOn ? .on : .off
        cameraService.photoOutput.capturePhoto(with: photoSettings, delegate: cameraService)

        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

extension CamViewController {

    @objc private func didPinch(_ recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed {
            cameraService.setZoom(scale: recognizer.scale)
        }
    }
}

// MARK: - checking permision

extension CamViewController {

    private func checkPermissions() {
        let cameraAuthStatus =  AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch cameraAuthStatus {
        case .authorized:
            return
        case .denied:
            abort()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler:
                                            { (authorized) in
                if(!authorized){
                    abort()
                }
            })
        case .restricted:
            abort()
        @unknown default:
            fatalError()
        }
    }
}

// MARK: - Camera service delegate
extension CamViewController: CameraServiceDelegate {

    func setPhoto(image: UIImage) {
        delegate?.setPhoto(image: image)
        navigationController?.popViewController(animated: true)
    }
}
