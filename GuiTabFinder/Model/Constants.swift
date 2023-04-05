//
//  Constants.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 5/4/23.
//

import Foundation

struct leftSide {
    static let tabId = ",{&quot;id&quot;:"
    static let song = ",&quot;song_name&quot;:&quot;"
    static let artist = "artist_name&quot;:&quot;"
    static let type = ",&quot;type&quot;:&quot;"
    static let part = "&quot;part&quot;:&quot;"
    static let version = ",&quot;version&quot;:"
    static let votes = "&quot;votes&quot;:"
    static let rating = ",&quot;rating&quot;:"
    static let tabUrl = "tab_url&quot;:&quot;"
}

struct rightSide {
    static let tabId = ",&quot;song_id&quot;"
    static let artist = "&quot;,&quot;type&quot;"
    static let song = "&quot;,&quot;artist_id&quot;"
    static let type = "&quot;,&quot;part&quot;"
    static let part = "&quot;,&quot;version&quot;"
    static let version = ",&quot;votes&quot;:"
    static let votes = ",&quot;rating&quot;"
    static let rating = ",&quot;date&quot;:&quot;"
    static let blockEnding = "&quot;}"
}

struct HeaderURL {
    static let mainUg = "https://tabs.ultimate-guitar.com/"
    static let tabUg = "https://tabs.ultimate-guitar.com/tab/"
    static let titleSearchUg = "https://www.ultimate-guitar.com/search.php?title="
}

struct Endpoints {
    static let urlTabTypeUg = "&page=1&type=200"
    let searchItem = "Metallica"
    //let UgBaseUrl = "https://tabs.ultimate-guitar.com/tab/metallica/nothing-else-matters-tabs-8519"
    //let UgTabTypeUrl = "https://www.ultimate-guitar.com/search.php?title=\(searchItem)&page=1&type=200"
}


