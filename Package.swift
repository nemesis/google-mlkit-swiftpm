// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "GoogleMLKitSwiftPM",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "MLKitBarcodeScanning",
      targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"]
    ),
    .library(
      name: "MLKitFaceDetection",
      targets: ["MLKitFaceDetection", "MLImage", "MLKitVision", "Common"]
    ),
    .library(
      name: "MLKitImageLabeling",
      targets: [
        "ImageLabeling",
        "MLImage",
        "Common",
      ]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
    .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
    .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
    .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "1.7.2"),
    .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
  ],
  targets: [
    .binaryTarget(
      name: "MLImage",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLImage.xcframework.zip",
      checksum: "642df1b61b5f79c59510c6c7f7e84a86674df8bb432e6e3d46853dd620c0e74a"
    ),
    .binaryTarget(
      name: "MLKitBarcodeScanning",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitBarcodeScanning.xcframework.zip",
      checksum: "3253409d66154dce80a5db969b8bb63edd768f0455d866dca963bb5c853b6c88"
    ),
    .binaryTarget(
      name: "MLKitCommon",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitCommon.xcframework.zip",
      checksum: "a0ca81ffbf8b3c04d7163bf877056c8fad7b8920ff25bc393ae2343ac22fbcd9"
    ),
    .binaryTarget(
      name: "MLKitFaceDetection",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitFaceDetection.xcframework.zip",
      checksum: "4ba0b15bb6f0fb206de12f7596b977718d2835fd7b3ddf4610dd42f8dd6d377e"
    ),
    .binaryTarget(
      name: "MLKitImageLabeling",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitImageLabeling.xcframework.zip",
      checksum: "b6f0f67196dd2a9e36ed98e6ead37cdc5553dc523bfff31fc60174ddb43cbc87"
    ),
    .binaryTarget(
      name: "MLKitImageLabelingCommon",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitImageLabelingCommon.xcframework.zip",
      checksum: "5c0e55cbea21d8aa252af8f4c26b07236236357b1f2eae46de3e40a407d7e594"
    ),
    .binaryTarget(
      name: "MLKitObjectDetectionCommon",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitObjectDetectionCommon.xcframework.zip",
      checksum: "520eb1e7fe0973c306248d7ac5992b3fb2037ca32b478e5a83989eb5bcb32c2e"
    ),
    .binaryTarget(
      name: "MLKitVision",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitVision.xcframework.zip",
      checksum: "bff6d13cf7f6f75c0f673f34921f1a386b795dd4864fb611babd76f65f3f05ce"
    ),
    .binaryTarget(
      name: "MLKitVisionKitB",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/MLKitVisionKit.xcframework.zip",
      checksum: "e521a8d80b96b5f16cf153126ed0934bbec086bc712baf8dc061d0741744c5b2"
    ),
    .binaryTarget(
      name: "GoogleToolboxForMac",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/GoogleToolboxForMac.xcframework.zip",
      checksum: "9300d31d2da4c17f30fd9b7719350c90ddca7d8a2ef1113701da2bce216abf68"
    ),
    .binaryTarget(
      name: "GoogleUtilitiesComponents",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/GoogleUtilitiesComponents.xcframework.zip",
      checksum: "c93cc200f4b652244c68c6094163029e70df5657d5b6a985d592c767a6bc3543"
    ),
    .binaryTarget(
      name: "Protobuf",
      url: "https://github.com/nemesis/google-mlkit-swiftpm/releases/download/v3.2.0-image-labeling/Protobuf.xcframework.zip",
      checksum: "b030311c8cc886ea8ca43c58da93845e0aaccb6b216a2bf6d7b025f1380ab1d1"
    ),
    .target(
      name: "ImageLabeling",
      dependencies: [
        "MLKitImageLabeling",
        "MLKitCommon",
        "MLKitImageLabelingCommon",
        "MLKitVision",
        "MLKitVisionKit",
      ]
    ),
    .target(
      name: "MLKitVisionKit",
      dependencies: ["MLKitVisionKitB", "MLKitCommon", "MLKitImageLabelingCommon", "MLKitObjectDetectionCommon", "MLKitVision"]
    ),
    .target(
      name: "Common",
      dependencies: [
        "MLKitCommon",
        "GoogleToolboxForMac",
        "GoogleUtilitiesComponents",
        "Protobuf",
        .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
        .product(name: "GULEnvironment", package: "GoogleUtilities"),
        .product(name: "GULISASwizzler", package: "GoogleUtilities"),
        .product(name: "GULLogger", package: "GoogleUtilities"),
        .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
        .product(name: "GULNSData", package: "GoogleUtilities"),
        .product(name: "GULNetwork", package: "GoogleUtilities"),
        .product(name: "GULReachability", package: "GoogleUtilities"),
        .product(name: "GULUserDefaults", package: "GoogleUtilities"),
        .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
        .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
        .product(name: "nanopb", package: "nanopb"),
        .product(name: "FBLPromises", package: "promises"),
      ]
    ),
  ]
)
