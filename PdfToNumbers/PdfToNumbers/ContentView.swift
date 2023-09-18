//
//  ContentView.swift
//  PdfToNumbers
//
//  Created by Bokyung on 2023/09/18.
//

import SwiftUI
import PDFKit
import SpreadsheetView

struct ContentView: View {
    @State private var selectedPDFURL: URL?
    @State private var selectedImages: [UIImage]? // 이미지 배열을 옵셔널로 변경
    @State private var documentPickerVisible = false // DocumentPicker를 띄울지 여부

    var body: some View {
        NavigationView {
            VStack (spacing: 50){
                Button("파일 선택하기") {
                    self.documentPickerVisible = true
                }
                
                // PDF 선택 후 이미지로 변환
                Button("이미지 변환") {
                    if let pdfURL = selectedPDFURL {
                        self.convertPDFToImages(pdfURL: pdfURL)
                    }
                }
                
                if let selectedImages = selectedImages { // 이미지 배열을 옵셔널 바인딩
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(selectedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                }
                
                // 이미지를 Numbers앱으로 내보내기
                Button("내보내기") {
                    self.exportToNumbersApp()
                }
            } // VStack
            .font(.system(size: 20))
            .navigationTitle("PDF to Numbers")
            .sheet(isPresented: $documentPickerVisible) {
                DocumentPicker(selectedPDFURL: $selectedPDFURL, isPresented: $documentPickerVisible)
            }
        } // NavigationView
        .navigationViewStyle(.stack)
    }
    

    func convertPDFToImages(pdfURL: URL) {
        guard let pdfDocument = PDFDocument(url: pdfURL) else {
            return
        }
        
        var images: [UIImage] = []
        
        for pageIndex in 0..<pdfDocument.pageCount {
            if let pdfPage = pdfDocument.page(at: pageIndex) {
                let pdfImage = pdfPage.thumbnail(of: CGSize(width: pdfPage.bounds(for: .mediaBox).width, height: pdfPage.bounds(for: .mediaBox).height), for: .mediaBox)
                images.append(pdfImage) // 이미지를 바로 배열에 추가
            }
        }
        
        selectedImages = images
    }

    
    func exportToNumbersApp() {
        // 이미지를 Numbers 형식으로 내보내는 코드 추가
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    @Binding var selectedPDFURL: URL?
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .import)
        documentPicker.delegate = context.coordinator
        return documentPicker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker
        
        init(_ parent: DocumentPicker) {
            self.parent = parent
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let url = urls.first {
                parent.selectedPDFURL = url
                parent.isPresented = false
            }
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.isPresented = false
        }
    }
}
