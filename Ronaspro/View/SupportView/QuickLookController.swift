//
//  QuickLookController.swift
//  Ronaspro
//
//  Created by Baranov Alexey on 29.01.2021.
//

import SwiftUI
import QuickLook


struct QuickLookController: UIViewControllerRepresentable {

    var url: URL
    var onDismiss: () -> Void
    @Binding var isPresented: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func updateUIViewController(_ viewController: UINavigationController, context: UIViewControllerRepresentableContext<QuickLookController>) {
        if let controller = viewController.topViewController as? QLPreviewController {
            controller.reloadData()
        }
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        controller.reloadData()
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: context.coordinator,
            action: #selector(context.coordinator.dismiss)
        )
        return UINavigationController(rootViewController: controller)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var parent: QuickLookController

        @objc func dismiss() {
            parent.isPresented = false
        }

        init(_ qlPreviewController: QuickLookController) {
            self.parent = qlPreviewController
            super.init()
        }
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return self.parent.url as QLPreviewItem
        }

    }
}
