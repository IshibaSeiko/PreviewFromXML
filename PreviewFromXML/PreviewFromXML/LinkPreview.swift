//
//  LinkPreview.swift
//  PreviewFromXML
//
//  Created by STV-M025 on 2019/11/08.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit
import SwiftLinkPreview

protocol ReturnLinkPreview: class {
    func linkPreview(result: LinkPreviewResponse)
}

class LinkPreview: NSObject {
    
    weak var returnLinkPreviewDelegate: ReturnLinkPreview?
    
    let slp = SwiftLinkPreview(session: URLSession.shared,
    workQueue: SwiftLinkPreview.defaultWorkQueue,
    responseQueue: DispatchQueue.main,
        cache: DisabledCache.instance)
    
    func requestingPreview(url: String) {
        slp.preview(url,
                    onSuccess: { result in print("\(result)")
                            let resultData = LinkPreviewResponse.init(url: result.url,
                                                                      finalUrl: result.finalUrl,
                                                                      canonicalUrl: result.canonicalUrl,
                                                                      title: result.title,
                                                                      description: result.description,
                                                                      images: result.images,
                                                                      image: result.image,
                                                                      icon: result.icon,
                                                                      video: result.video,
                                                                      price: result.price)
                        self.returnLinkPreviewDelegate?.linkPreview(result: resultData)
        },
                    onError: { error in print("\(error)") })
    }

}
