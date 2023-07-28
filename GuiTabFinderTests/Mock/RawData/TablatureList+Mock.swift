//
//  TablatureList+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureListMock: XCTestCase {
    static func makeHtmlMock() -> String {
        let data = """
    results&quot;:[{&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;artist_id&quot;:13302,&quot;artist_url&quot;:&quot;/artist/insomnium_13302&quot;,&quot;song_name&quot;:&quot;Heart Like A Grave&quot;,&quot;marketing_type&quot;:&quot;official&quot;,&quot;tab_id&quot;:3797870,&quot;tab_url&quot;:&quot;https://www.ultimate-guitar.com/pro/?app_utm_source=UltimateGuitar&amp;app_utm_medium=Search&amp;app_utm_campaign=UG+Search&amp;app_utm_content=Official+Version&amp;artist=Insomnium&amp;song=heart%20like%20a%20grave&amp;tab_id=4241428&quot;,&quot;device&quot;:null,&quot;app_link&quot;:&quot;//www.ultimate-guitar.com/send?ug_from=yozio_splash&amp;url=https://play.google.com/store/apps/details?id=com.ultimateguitar.tabs&amp;ug_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&amp;referrer=utm_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&quot;,&quot;highlight&quot;:{&quot;song_name&quot;:[],&quot;artist_name&quot;:[[0,9]]}},{&quot;id&quot;:3797870,&quot;song_id&quot;:3693587,&quot;song_name&quot;:&quot;Heart Like A Grave&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1626692806&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:59434,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:&quot;&quot;,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/heart-like-a-grave-tabs-3797870&quot;},{&quot;id&quot;:3875930,&quot;song_id&quot;:3693587,&quot;song_name&quot;:&quot;Heart Like A Grave&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;solo&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1631897321&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:59434,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;C&quot;,&quot;version_description&quot;:&quot;&quot;,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/heart-like-a-grave-tabs-3875930&quot;},{&quot;id&quot;:1169763,&quot;song_id&quot;:170947,&quot;song_name&quot;:&quot;Down With The Sun&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:5,&quot;rating&quot;:4.67550000000000043343106881366111338138580322265625,&quot;date&quot;:&quot;1343088001&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:1491,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/down-with-the-sun-tabs-1169763&quot;},{&quot;id&quot;:1759827,&quot;song_id&quot;:1616844,&quot;song_name&quot;:&quot;The Swarm&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:4,&quot;rating&quot;:4.62913999999999958845364744774997234344482421875,&quot;date&quot;:&quot;1439713313&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/the-swarm-tabs-1759827&quot;},{&quot;id&quot;:1007055,&quot;song_id&quot;:242397,&quot;song_name&quot;:&quot;Weather The Storm&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1290729601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/weather-the-storm-tabs-1007055&quot;},{&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;artist_id&quot;:13302,&quot;artist_url&quot;:&quot;/artist/insomnium_13302&quot;,&quot;song_name&quot;:&quot;Decoherence&quot;,&quot;marketing_type&quot;:&quot;official&quot;,&quot;tab_id&quot;:1757683,&quot;tab_url&quot;:&quot;https://www.ultimate-guitar.com/pro/?app_utm_source=UltimateGuitar&amp;app_utm_medium=Search&amp;app_utm_campaign=UG+Search&amp;app_utm_content=Official+Version&amp;artist=Insomnium&amp;song=decoherence&amp;tab_id=2214683&quot;,&quot;device&quot;:null,&quot;app_link&quot;:&quot;//www.ultimate-guitar.com/send?ug_from=yozio_splash&amp;url=https://play.google.com/store/apps/details?id=com.ultimateguitar.tabs&amp;ug_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&amp;referrer=utm_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&quot;,&quot;highlight&quot;:{&quot;song_name&quot;:[],&quot;artist_name&quot;:[[0,9]]},&quot;tracks&quot;:&quot;Acoustic Guitar (nylon), Acoustic Guitar (steel) (x2), Electric Bass (finger), Pad 2 (warm), String Ensemble 2, Drums&quot;,&quot;duration&quot;:&quot;3:07&quot;},{&quot;id&quot;:1757683,&quot;song_id&quot;:317229,&quot;song_name&quot;:&quot;Decoherence&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1438942010&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:17431,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;},{&quot;id&quot;:780378,&quot;song_id&quot;:170953,&quot;song_name&quot;:&quot;In The Groves Of Death&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:4,&quot;rating&quot;:3.771999999999999797495320308371447026729583740234375,&quot;date&quot;:&quot;1232582401&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3801,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/in-the-groves-of-death-tabs-780378&quot;},{&quot;id&quot;:460654,&quot;song_id&quot;:170954,&quot;song_name&quot;:&quot;In The Halls Of Awaiting&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:4,&quot;rating&quot;:4.7720000000000002415845301584340631961822509765625,&quot;date&quot;:&quot;1168992001&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3782,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/in-the-halls-of-awaiting-tabs-460654&quot;},{&quot;id&quot;:1451747,&quot;song_id&quot;:170955,&quot;song_name&quot;:&quot;Into The Woods&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1389225601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3784,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/into-the-woods-tabs-1451747&quot;},{&quot;id&quot;:725082,&quot;song_id&quot;:170957,&quot;song_name&quot;:&quot;Last Statement&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;solo&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1219795201&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3802,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/last-statement-tabs-725082&quot;},{&quot;id&quot;:2931032,&quot;song_id&quot;:1443343,&quot;song_name&quot;:&quot;Lose To Night&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1576578825&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;G&quot;,&quot;version_description&quot;:&quot;&quot;,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/lose-to-night-tabs-2931032&quot;},{&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;artist_id&quot;:13302,&quot;artist_url&quot;:&quot;/artist/insomnium_13302&quot;,&quot;song_name&quot;:&quot;Mortal Share&quot;,&quot;marketing_type&quot;:&quot;official&quot;,&quot;tab_id&quot;:538831,&quot;tab_url&quot;:&quot;https://www.ultimate-guitar.com/pro/?app_utm_source=UltimateGuitar&amp;app_utm_medium=Search&amp;app_utm_campaign=UG+Search&amp;app_utm_content=Official+Version&amp;artist=Insomnium&amp;song=mortal%20share&amp;tab_id=2528505&quot;,&quot;device&quot;:null,&quot;app_link&quot;:&quot;//www.ultimate-guitar.com/send?ug_from=yozio_splash&amp;url=https://play.google.com/store/apps/details?id=com.ultimateguitar.tabs&amp;ug_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&amp;referrer=utm_campaign=UG_TPAndroid_SearchTpLink_SearchPage_mobile0&quot;,&quot;highlight&quot;:{&quot;song_name&quot;:[],&quot;artist_name&quot;:[[0,9]]}},{&quot;id&quot;:538831,&quot;song_id&quot;:170960,&quot;song_name&quot;:&quot;Mortal Share&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:6,&quot;rating&quot;:2.48932999999999982065901349415071308612823486328125,&quot;date&quot;:&quot;1182729601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3786,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/mortal-share-tabs-538831&quot;},{&quot;id&quot;:608939,&quot;song_id&quot;:170960,&quot;song_name&quot;:&quot;Mortal Share&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:2,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1196726401&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3786,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/mortal-share-tabs-608939&quot;},{&quot;id&quot;:804225,&quot;song_id&quot;:170960,&quot;song_name&quot;:&quot;Mortal Share&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:3,&quot;votes&quot;:7,&quot;rating&quot;:4.7403700000000004166622602497227489948272705078125,&quot;date&quot;:&quot;1237593601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:3786,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:&quot;&quot;,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/mortal-share-tabs-804225&quot;},{&quot;id&quot;:953381,&quot;song_id&quot;:221798,&quot;song_name&quot;:&quot;The Gale&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;solo&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1275004801&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/the-gale-tabs-953381&quot;},{&quot;id&quot;:897854,&quot;song_id&quot;:170965,&quot;song_name&quot;:&quot;Where The Last Wave Broke&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:5,&quot;rating&quot;:4.80050000000000043343106881366111338138580322265625,&quot;date&quot;:&quot;1259625601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/where-the-last-wave-broke-tabs-897854&quot;},{&quot;id&quot;:971769,&quot;song_id&quot;:228891,&quot;song_name&quot;:&quot;Insomnium&quot;,&quot;artist_id&quot;:12242,&quot;artist_name&quot;:&quot;Through the Eyes of the Dead&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;intro&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1280361601&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:0,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/through_the_eyes_of_the_dead_12242&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/through-the-eyes-of-the-dead/insomnium-tabs-971769&quot;}]

    """
        return data
    }
}
