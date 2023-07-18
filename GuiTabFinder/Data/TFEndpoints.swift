//
//  Constants.swift
//  GuiTabFinder
//
//  Created by Toni Lozano Fernández on 5/4/23.
//

import Foundation

struct TFEndpoints {
    enum leftSide {
        static let results = "results&quot;:["
        static let tabId = "{&quot;id&quot;:"
        static let song = ",&quot;song_name&quot;:&quot;"
        static let artist = "artist_name&quot;:&quot;"
        static let type = ",&quot;type&quot;:&quot;"
        static let part = "&quot;part&quot;:&quot;"
        static let version = ",&quot;version&quot;:"
        static let votes = "&quot;votes&quot;:"
        static let rating = ",&quot;rating&quot;:"
        static let tabUrl = "tab_url&quot;:&quot;"
        static let tabBlock = "{&quot;wiki_tab&quot;:{&quot;content&quot;:&quot;"
        static let tabTuningBlockEnding = "&quot;,&quot;value&quot;:&quot;"
    }
    
    enum rightSide {
        static let result = "&quot;}]"
        static let tabId = ",&quot;song_id&quot;:"
        static let artist = "&quot;,&quot;type&quot;"
        static let song = "&quot;,&quot;artist_id&quot;"
        static let type = "&quot;,&quot;part&quot;"
        static let part = "&quot;,&quot;version&quot;"
        static let version = ",&quot;votes&quot;:"
        static let votes = ",&quot;rating&quot;"
        static let rating = ",&quot;date&quot;:&quot;"
        static let blockEnding = "&quot;}"
        static let tabBlockEnding = "&quot;,&quot;revision_id&quot;:"
        static let tabTuningBlockEnding = "&quot;,&quot;index&quot;:"
        static let containMarketingType = "&quot;,&quot;marketing_type&quot;:&quot;official"
    }

    enum HeaderURL {
        static let mainUg = "https://tabs.ultimate-guitar.com/"
        static let tabUg = "https://tabs.ultimate-guitar.com/tab/"
        static let titleSearchUg = "https://www.ultimate-guitar.com/search.php?title="
    }

    static let urlTabTypeUg = "&type=200"
    static let urlTabPageUG = "&page="
}

extension TFEndpoints {
    static func generateURLWithParams(baseUrl: String, searchText: String, page: String) -> String {
        let fixedTextTitle = searchText.replacingOccurrences(of: " ", with: "%20")
        let url = baseUrl + fixedTextTitle + TFEndpoints.urlTabPageUG + page + TFEndpoints.urlTabTypeUg

        return url
    }
}
