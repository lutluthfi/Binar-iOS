//
//  ARDisplayPDFViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 19/05/22.
//

import PDFKit
import UIKit

final class ARDisplayPDFViewController: UIViewController {
    private(set) lazy var pdfView: PDFView = {
        let view = PDFView(frame: view.safeAreaLayoutGuide.layoutFrame)
        view.autoScales = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .secondarySystemBackground
        view.displayMode = .singlePage
        view.displayDirection = .vertical
        view.setValue(true, forKey: "forcesTopAlignment")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileUrl: URL? = Bundle.main.url(forResource: "JSC-2021", withExtension: "pdf")
        
        guard let _fileUrl = fileUrl else { return }
        
        pdfView.document = PDFDocument(url: _fileUrl)
        pdfView.minScaleFactor = pdfView.scaleFactor
        pdfView.maxScaleFactor = 4
        
        view.addSubview(pdfView)
        
        let nextBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(onNextBarButtonTap))
        let prevBarButton = UIBarButtonItem(title: "Prev", style: .plain, target: self, action: #selector(onPrevBarButtonTap))
        navigationItem.rightBarButtonItems = [nextBarButton, prevBarButton]
        
        NotificationCenter.default.addObserver(self, selector: #selector(onPDFViewPageChange), name: Notification.Name.PDFViewPageChanged, object: nil)
        updateTitle()
    }
    
    private func updateTitle() {
        let pageNumber: Int = pdfView.currentPage?.pageRef?.pageNumber ?? 0
        navigationItem.title = String(pageNumber)
    }
    
    @objc private func onPDFViewPageChange() {
        updateTitle()
    }
    
    @objc private func onNextBarButtonTap() {
        pdfView.goToNextPage(self)
    }
    
    @objc private func onPrevBarButtonTap() {
        pdfView.goToPreviousPage(self)
    }
}
