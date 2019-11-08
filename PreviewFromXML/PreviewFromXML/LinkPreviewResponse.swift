//
//  LinkPreviewResponse.swift
//  PreviewFromXML
//
//  Created by STV-M025 on 2019/11/08.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

struct LinkPreviewResponse: Codable {
    let url: URL? // URL
    let finalUrl: URL? // unshortened URL
    let canonicalUrl: String? // canonical URL
    let title: String? // title
    let description: String? // page description or relevant text
    let images: [String]? // array of URLs of the images
    let image: String? // main image
    let icon: String? // favicon
    let video: String? // video
    let price: String? // price
}
