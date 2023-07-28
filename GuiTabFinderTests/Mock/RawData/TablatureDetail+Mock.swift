//
//  TablatureDetail+Mock.swift
//  GuiTabFinderTests
//
//  Created by Toni Lozano Fernández on 27/7/23.
//

import XCTest
@testable import GuiTabFinder

final class TablatureDetailMock: XCTestCase {
    static func makeHtmlMock() -> String {
        let data = """

.com/tab/insomnium/decoherence-tabs-1757683&quot;,&quot;date_update&quot;:&quot;1439212968&quot;,&quot;user_id&quot;:9630691,&quot;user_iq&quot;:114,&quot;username&quot;:&quot;PUNC4KE&quot;,&quot;type_name&quot;:&quot;Tab&quot;,&quot;best_pro_tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-guitar-pro-1487762&quot;},&quot;backing_track_tip&quot;:false,&quot;tab_view&quot;:{&quot;wiki_tab&quot;:{&quot;content&quot;:&quot;-------------------------------------------------------------------------------\r\n                             DECOHERENCE - INSOMNIUM\r\n-------------------------------------------------------------------------------\r\nTabbed by: PUNC4KE\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------10------10-8-------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9----------9---|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7------7---7-|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8---------------------------------------|\r\nB|------------------------------------------------------11---------11-10----------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9---------------------12----|\r\nD|-----------------------------------------------------------12-------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----10----10-------10----10-|\r\nE|--------------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|-------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8-----------------------------------|\r\nG|------------------------------------------------------------------9---9---9-10---9---|\r\nD|-------12----12----12-------12----12----12-----------10---10---10--------------------|\r\nA|-------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8---8------8---8-|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------10------10-8-------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9----------9---|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7------7---7-|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8---------------------------------------|\r\nB|------------------------------------------------------11---------11-10----------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9---------------------12----|\r\nD|-----------------------------------------------------------12-------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----10----10-------10----10-|\r\nE|--------------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|-------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8-----------------------------------|\r\nG|------------------------------------------------------------------9---9---9-10---9---|\r\nD|-------12----12----12-------12----12----12-----------10---10---10--------------------|\r\nA|-------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8---8------8---8-|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|------------------------------------------------------------------------------|\r\nB|-8----------------8-----------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9------------------|\r\nD|---------------------------------------------------------------10---10---7-10-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7----------------|\r\nE|------------------------------------------------------------------8----8------|[/tab]&quot;,&quot;revision_id&quot;:2,&quot;user_id&quot;:9630691,&quot;username&quot;:&quot;PUNC4KE&quot;,&quot;date&quot;:1439227368},&quot;contributors&quot;:[],&quot;strummings&quot;:[],&quot;has_hq_description&quot;:0,&quot;blocked&quot;:false,&quot;adsupp_binary_blocked&quot;:null,&quot;meta&quot;:{&quot;difficulty&quot;:&quot;intermediate&quot;},&quot;has_official_version&quot;:true,&quot;has_chord_pro&quot;:false,&quot;has_preset&quot;:false,&quot;versions&quot;:[
"""
        return data
    }
}
