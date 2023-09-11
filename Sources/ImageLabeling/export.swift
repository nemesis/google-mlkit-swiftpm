import MLKitImageLabeling
import MLKitVision

public enum Analyzer {
  public static func mlKitAnalysis(image: UIImage, completion: @escaping ([ImageLabel]?, Error?) -> Void) {
    let visionImage = VisionImage(image: image)
    visionImage.orientation = image.imageOrientation

    let options = ImageLabelerOptions()
    options.confidenceThreshold = NSNumber(floatLiteral: 0.3)

    let imageLabeler = ImageLabeler.imageLabeler(options: options)

    imageLabeler.process(visionImage) { (labels: [ImageLabel]?, error: Error?) in
      guard error == nil else {
        let errStr = error?.localizedDescription ?? ""
        print("ML Kit error: \(errStr)")
        completion(nil, error)
        return
      }

      guard let labels, !labels.isEmpty else {
        print("ML Kit error: no labels found")
        let error = NSError(domain: "Testbed ML Kit: no labels", code: -1)
        completion(nil, error)
        return
      }

      completion(labels, nil)
    }
  }
}

