//
//  PlaylistController.swift
//  Playlist
//
//  Created by Nathan on 5/11/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class PlaylistController {
    
    private let kPlaylist = "storedPlaylists"
    
    static let sharedInstance = PlaylistController()
    
    var playlists = [Playlist]()
    
    init() {
        loadFromPersistentStore()
    }
    
    //CRUD
    
    //Create
    func addPlaylist(name: String) {
        let playlist = Playlist(name: name, songs: [])
        playlists.append(playlist)
        saveToPersistantStore()
    }
    
    //Retrieve 
    func loadFromPersistentStore() {
        guard let playlistDictionaries = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylist) as? [[String: AnyObject]] else {
            return
        }
        playlists = playlistDictionaries.flatMap({Playlist(dictionary: $0)})
    }
    
    //Delete
    func deletePlaylist(playlist: Playlist) {
        guard let indexOfPlaylist = playlists.indexOf(playlist) else {
            return
        }
        playlists.removeAtIndex(indexOfPlaylist)
        saveToPersistantStore()
    }
    
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistantStore()
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let indexOfSong = playlist.songs.indexOf(song) else {
            return
        }
        playlist.songs.removeAtIndex(indexOfSong)
        saveToPersistantStore()
    }
    
    func saveToPersistantStore() {
        NSUserDefaults.standardUserDefaults().setObject(playlists.map({$0.dictionaryCopy}), forKey: kPlaylist)
    }
}