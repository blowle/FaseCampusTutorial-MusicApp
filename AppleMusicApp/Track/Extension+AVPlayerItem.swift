//
//  Extension+AVPlayerItem.swift
//  AppleMusicApp
//
//  Created by Dev on 2021/04/19.
//

import AVFoundation
import UIKit


extension AVPlayerItem {
    func convertToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackAlbumName: String?
        var trackArtwork: UIImage?
        
        for metadata in metadataList {
            if let title = metadata.title {
                trackTitle = title
            }
            if let artist = metadata.artist {
                trackArtist = artist
            }
            if let albumName = metadata.albumName {
                trackAlbumName = albumName
            }
            if let artwork = metadata.artwork {
                trackArtwork = artwork
            }
        }
    }
}


extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    var albumName: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    var artwork: UIImage? {
        guard let key = commonKey?.rawValue, key == "title",
              let data = dataValue, let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}