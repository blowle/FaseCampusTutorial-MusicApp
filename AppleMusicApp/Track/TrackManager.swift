//
//  TrackManager.swift
//  AppleMusicApp
//
//  Created by Dev on 2021/04/19.
//

import UIKit
import AVFoundation

class TrackManager {
    // TODO: 프로퍼티 정의하기 - 트랙들, 앨범들, 오늘의 곡
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    // TODO: 생성자 정의하기
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    // TODO: 트랙 로드하기
    func loadTracks() -> [AVPlayerItem] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map { url in
            return AVPlayerItem(url: url)
        }
        
        return items
    }
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        return playerItem.convertToTrack()
    }
    
    // TODO: 앨범 로드메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack() }
        let albumDic = Dictionary(grouping: trackList, by: {
                                    (track) in track.albumName})
        var albums: [Album] = []
        for (key, value) in albumDic {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }
    
    // TODO: 오늘의 트랙 랜덤으로 선택
    func loadOtherTodaysTrack() {
        return self.todaysTrack = self.tracks.randomElement()
    }
}
