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
<!doctype html>
<html lang="en">
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# article: http://ogp.me/ns/article#">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>DECOHERENCE TAB by Insomnium @ Ultimate-Guitar.Com</title>
<meta name="keywords" content="Insomnium - Decoherence (Tab), Tab, Insomnium, Ultimate-Guitar.Com, ug">
    <script>
    (function () {
        var isTouch = 'ontouchstart' in window || 'onmsgesturechange' in window;
        var isMac = ['Macintosh', 'MacIntel', 'MacPPC', 'Mac68K'].indexOf(window.navigator.platform) > -1;

        if (isMac && isTouch) {
            var date = new Date();
            date.setFullYear(date.getFullYear() + 1);

            document.cookie = '_ug_force_ipad=1;path=/;domain=.ultimate-guitar.com;expires=' + date.toUTCString() + ';';
            window.location = window.location.href
        }
    })()
</script>
    <script>
    !function(n,e){var t,o,i,c=[],f={passive:!0,capture:!0},r=new Date,a="pointerup",u="pointercancel";function p(n,c){t||(t=c,o=n,i=new Date,w(e),s())}function s(){o>=0&&o<i-r&&(c.forEach(function(n){n(o,t)}),c=[])}function l(t){if(t.cancelable){var o=(t.timeStamp>1e12?new Date:performance.now())-t.timeStamp;"pointerdown"==t.type?function(t,o){function i(){p(t,o),r()}function c(){r()}function r(){e(a,i,f),e(u,c,f)}n(a,i,f),n(u,c,f)}(o,t):p(o,t)}}function w(n){["click","mousedown","keydown","touchstart","pointerdown"].forEach(function(e){n(e,l,f)})}w(n),self.perfMetrics=self.perfMetrics||{},self.perfMetrics.onFirstInputDelay=function(n){c.push(n),s()}}(addEventListener,removeEventListener);
</script>
    
<link rel='preload' href='https://tabs.ultimate-guitar.com/static/public/build/ug_react/vendor.7b58a431e6230d809aae4a211ee10b80.js' as='script'></link>    <link rel='preload' href='https://tabs.ultimate-guitar.com/static/public/build/ug_react/202307/4578.b094ac652f05f1a1539c459b2af41f3f.js' as='script'></link>                <link rel='preload' href='https://tabs.ultimate-guitar.com/static/public/build/ug_react/ug~runtime.baae4f8ca21fe7030c0f9ca00dd7258d.js' as='script'></link>        <link rel='preload' href='https://tabs.ultimate-guitar.com/static/public/build/ug_react/ug.27f51102319f34cc1b3a9727ffbb22fa.js' as='script'></link>                    <link rel="preload" href="https://tabs.ultimate-guitar.com/static/public/video/fp/fp-video-poster.288x162.jpg" as="image" />
            <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="alternate" hreflang="x-default" href="https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683" />
<link rel="alternate" hreflang="en" href="https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683" />
<link rel="alternate" hreflang="pt" href="https://pt.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683" />
<link rel="alternate" hreflang="es" href="https://es.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683" />
<meta property="fb:app_id" content="539490962762175">
<meta property="og:type" content="music.song">
<meta property="og:title" content="Insomnium - Decoherence (Tab)">
<meta property="og:description" content="TAB by Insomnium">
<meta property="og:image" content="https://tabs.ultimate-guitar.com/static/_img/ug-logo-fb.png">                <meta name="viewport" class="js-viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <script>
            (function() {
                var viewport = document.querySelector('.js-viewport');
                var date = new Date();
                date.setFullYear(date.getFullYear() + 1);
                function setViewport() {
                    var isLargeViewport = (screen.availWidth > 1300 || screen.availHeight > 1300) && window.matchMedia("(orientation: landscape)").matches;
                    viewport.setAttribute('content', isLargeViewport ? 'width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no' : 'width=1280, minimum-scale=0.1, maximum-scale=5.0');
                    document.cookie = '_ug_small_screen=' + (isLargeViewport ? 0 : 1) +';path=/;domain=.ultimate-guitar.com;expires=' + date.toUTCString() + ';';
                }
                setViewport();
                window.matchMedia("(orientation: landscape)").addEventListener('change', setViewport)
            })()
        </script>
        <meta name="csrf-param" content="_csrf">
<meta name="csrf-token" content="hwRt4FFwCReIEC5_s0uVcOWgYQWqaIMQyFKbrvnxGtLCbCmJJC9ic_51aD7wBPcko8sTQe8RriaiZ8vfrKFFiw==">
            <link rel="search"
    type="application/opensearchdescription+xml"
    href="//tabs.ultimate-guitar.com/static/opensearch/opensearch.xml"
    title="Ultmate-Guitar tabs & chords search" />    <meta name="theme-color" content="#272727">
    
    <link rel="manifest" href="/manifest_new.json">
<link rel="icon" type="image/x-icon" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/favicon.ico">
<link rel="shortcut icon" type="image/png" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/favicon.png" />
<link rel="apple-touch-icon" sizes="32x32" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-48x48_ver2.png" />
<link rel="apple-touch-icon" sizes="48x48" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-48x48_ver2.png" />
<link rel="apple-touch-icon" sizes="72x72" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-72x72_ver2.png" />
<link rel="apple-touch-icon" sizes="96x96" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-96x96_ver2.png" />
<link rel="apple-touch-icon" sizes="144x14" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-144x144_ver2.png" />
<link rel="apple-touch-icon" sizes="192x192" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-192x192_ver2.png" />
<link rel="apple-touch-icon" sizes="512x512" href="//tabs.ultimate-guitar.com/static/public/img/product_icons/ug/apple-touch-icon-512x512_ver2.png" />
<meta name="application-name" content="Ultimate Guitar" />
    
        <script>
        var sentryMethodsToSave = ['setUser', 'setTag', 'setTags', 'setExtra', 'setExtras', 'addBreadcrumb', 'setContext'];
        window.Sentry = {
            _lazy: true
        };
        var sentryLazyCallsQueue = [];
        var sentryLazyHandler = function () {
            var args = Array.prototype.slice.call(arguments)
            var methodName = args[0];
            var rest = args.slice(1);

            sentryLazyCallsQueue.push([methodName, rest])
        };

        sentryMethodsToSave.forEach(function (methodName) {
            window.Sentry[methodName] = sentryLazyHandler.bind(this, methodName);
        });

        function applySentryLazyData() {
            if (!sentryLazyCallsQueue) return;

            for (var i = 0; i < sentryLazyCallsQueue.length; i++) {
                var args = sentryLazyCallsQueue[i];
                var methodName = args[0];
                var restArgs = args[1];
                var method = window.Sentry[methodName];

                method && typeof method === 'function' && method.apply(window.Sentry, restArgs);
            }

            sentryLazyCallsQueue = undefined;
        }

        var errors = window.APPERROR ? (window.APPERROR.errors || []) : []
        var UGERROR = {
            errors,
            loggerLoaded: false,
        };
        var oldOnError = window.onerror;
        var loadScript = function (src, resolve) {
            UGERROR.loggerLoaded = true;
            var script = document.createElement('script');
            script.async = true;
            script.type = 'text/javascript';
            script.src = src;

            var changeState = function () {
                if (!loaded) {
                    resolve()
                    loaded = true;
                }
            };
            var loaded;

            script.onreadystatechange = changeState;
            script.onload = changeState;

            var node = document.getElementsByTagName('script')[0];
            node.parentNode.insertBefore(script, node);
        };

        UGERROR.loadErrorLogger = function (release) {
            var whitelistUrls = [
                new RegExp('https://tabs.ultimate-guitar.com/static/public'),
            ];

            if (window.location.pathname !== '/') {
                whitelistUrls.push(new RegExp(window.location.href))
            }

            var tags = {
                source: 'tabs',
                country: 'ES',
                isProUser: false,
                isAuthenticated: false,
                userId: '0',
            };

            !UGERROR.loggerLoaded && loadScript('https://tabs.ultimate-guitar.com/static/public/build/sentry_0_0_2/sentry_ver1690485550.js', function () {
                console.log('[sentry]:', 'bundle successfully loaded')
                window.onerror = oldOnError;

                window.initSentry({
                    dsn: 'https://71cf858585c249f5b0f360c3ab811c84@sentry10.ultimate-guitar.com/7',
                    release: release,
                    allowUrls: whitelistUrls
                });

                window.Sentry.setTags(tags);
                window.Sentry.setUser({
                    userId: '0'
                });
                window.Sentry.setContext('Client a/b variations', {"2681":1,"2801":2,"3005":2,"3017":2,"3020":1,"3037":1,"3040":1,"725":2,"824":2,"857":2,"902":2,"923":2,"947":1,"950":2,"956":1,"965":1,"992":2,"1430":3,"1433":2,"1436":2,"1483":2,"1492":2,"1495":2,"1522":2,"1615":2,"1618":2,"1678":2,"1750":2,"1765":2,"1816":2,"1966":3,"2084":2,"2150":1,"2153":2,"2225":1,"2513":3,"2948":2});

                applySentryLazyData();

                var messages = UGERROR.errors.map(function (err) {
                    return err[0];
                });
                UGERROR.errors
                    .filter(function (error, index) {
                        return messages.indexOf(error[0]) === index;
                    })
                    .forEach(function (args) {
                        var error = args[0];

                        if (args.length > 1) {
                            window.onerror.apply(this, args);
                        } else if (typeof error === 'string') {
                            window.Sentry.captureMessage(error, 'error');
                        } else {
                            if (error === undefined) {
                                error = new Error('Caught undefined error');
                            }

                            window.Sentry.captureException(error);
                        }
                    });
            })
        };

        function loadSentry() {
            if (UGERROR.hasFirstError) {
                return
            }

            function load() {
                UGERROR.loadErrorLogger("ug-web_app_1.01.38");
            }

            if (document.readyState === 'complete') {
                load();
            } else {
                window.addEventListener('load', load)
            }
            UGERROR.hasFirstError = true
        }

        if (UGERROR.errors && UGERROR.errors.length > 0) {
            loadSentry()
        }

        window.onerror = function () {
            UGERROR.errors.push(arguments);
            oldOnError && oldOnError.apply(this, arguments);

            var message = typeof arguments[0] === 'object' && arguments[0].message
            if (typeof message === 'string' && message.toLowerCase().indexOf('loading chunk') && window.UGAPP.trigger) {
                window.UGAPP.trigger('globalEvent:YM:metrica', 'Chunk Load Error')
            }

            loadSentry();
        };
    </script>
                    <script>
        (function () {
            if ('serviceWorker' in navigator) {
                window.addEventListener('load', function() {
                    window.navigator.serviceWorker.getRegistrations().then(function(registrations) {
                        registrations.forEach(function(registration) {
                            if (
                                registration.active.scriptURL.indexOf('sw_ug.js') !== -1
                                ||
                                registration.active.scriptURL.indexOf('sw_ug_v2.js') !== -1
                            ) {
                                registration.unregister()
                            }
                        })
                    })
                    window.navigator.serviceWorker.register('/sw_ug_v3.js').catch(function(error) {})
                })
            }
        })()
    </script>
                <script type="text/javascript" async=true>
    (function() {
        var TCF_LOCATOR_NAME = '__tcfapiLocator';
        var queue = [];
        var win = window;
        var cmpFrame;

        function addFrame() {
            var doc = win.document;
            var otherCMP = !!(win.frames[TCF_LOCATOR_NAME]);

            if (!otherCMP) {
                if (doc.body) {
                    var iframe = doc.createElement('iframe');

                    iframe.style.cssText = 'display:none';
                    iframe.name = TCF_LOCATOR_NAME;
                    doc.body.appendChild(iframe);
                } else {
                    setTimeout(addFrame, 5);
                }
            }
            return !otherCMP;
        }

        function tcfAPIHandler() {
            var gdprApplies;
            var args = arguments;

            if (!args.length) {
                return queue;
            } else if (args[0] === 'setGdprApplies') {
                if (
                    args.length > 3 &&
                    args[2] === 2 &&
                    typeof args[3] === 'boolean'
                ) {
                    gdprApplies = args[3];
                    if (typeof args[2] === 'function') {
                        args[2]('set', true);
                    }
                }
            } else if (args[0] === 'ping') {
                var retr = {
                    gdprApplies: gdprApplies,
                    cmpLoaded: false,
                    cmpStatus: 'stub'
                };

                if (typeof args[2] === 'function') {
                    args[2](retr);
                }
            } else {
                queue.push(args);
            }
        }

        function postMessageEventHandler(event) {
            var msgIsString = typeof event.data === 'string';
            var json = {};

            try {
                if (msgIsString) {
                    json = JSON.parse(event.data);
                } else {
                    json = event.data;
                }
            } catch (ignore) {
            }

            var payload = json.__tcfapiCall;

            if (payload) {
                window.__tcfapi(
                    payload.command,
                    payload.version,
                    function (retValue, success) {
                        var returnMsg = {
                            __tcfapiReturn: {
                                returnValue: retValue,
                                success: success,
                                callId: payload.callId
                            }
                        };
                        if (msgIsString) {
                            returnMsg = JSON.stringify(returnMsg);
                        }
                        event.source.postMessage(returnMsg, '*');
                    },
                    payload.parameter
                );
            }
        }

        while (win) {
            try {
                if (win.frames[TCF_LOCATOR_NAME]) {
                    cmpFrame = win;
                    break;
                }
            } catch (ignore) {}

            if (win === window.top) {
                break;
            }
            win = win.parent;
        }
        if (!cmpFrame) {
            if (window === window.top) {
                addFrame();
                win.__tcfapi = tcfAPIHandler;
                win.addEventListener('message', postMessageEventHandler, false);
            } else {
                window.__tcfapi = tcfAPIHandler;
                window.addEventListener('message', postMessageEventHandler, false);
            }
        }
    })();
</script>
                                    <style>
        #ad_cs_5723252_300_250 > div > iframe:only-child {
            display: none;
        }
    </style>
    <script>
        document.domain = 'ultimate-guitar.com';
    </script>
            
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&subset=latin,latin-ext,greek,hebrew,vietnamese,arabic,devanagari,cyrillic,cyrillic-ext,khmer,greek-ext,tamil,thai,telugu,bengali,gujarati">
    

    
</head>
<body style="background-color: #111; margin: 0" >
<script>
    var hasFirstTap = false;
    (function () {
        function onFirstTap () {
            hasFirstTap = true
            document.body.removeEventListener('touchstart', onFirstTap)
        }

        document.body.addEventListener('touchstart', onFirstTap)
    })()
</script>



    <div class="js-page js-global-wrapper">
            </div>
<div class="js-cmp"></div>
    <div class="js-store" data-content="{&quot;config&quot;:{&quot;releaseVer&quot;:&quot;ug-web_app_1.01.38&quot;,&quot;abVariation&quot;:null,&quot;abVariation2&quot;:null,&quot;abVariation3&quot;:null,&quot;abTestAccountVariation&quot;:[],&quot;experiments&quot;:{&quot;isPianoChordGroup&quot;:false},&quot;urlFacebook&quot;:&quot;https://www.ultimate-guitar.com/user/auth/oauth?service=facebook&quot;,&quot;urlGoogle&quot;:&quot;https://www.ultimate-guitar.com/user/auth/oauth?service=google&quot;,&quot;urlApple&quot;:&quot;https://www.ultimate-guitar.com/user/auth/oauth?service=apple&quot;,&quot;main_server&quot;:&quot;ultimate-guitar.com&quot;,&quot;ps_server&quot;:&quot;plus.ultimate-guitar.com&quot;,&quot;static_server&quot;:&quot;https://tabs.ultimate-guitar.com/static&quot;,&quot;statik_cache&quot;:&quot;_ver1690485550&quot;,&quot;staticPrefix&quot;:&quot;/static&quot;,&quot;time&quot;:1690489918000,&quot;isGDPRAvailable&quot;:true,&quot;isCcpaAvailable&quot;:false,&quot;user&quot;:{&quot;id&quot;:0,&quot;uuid&quot;:1914592281,&quot;unified_id&quot;:&quot;1.1681458371.228495&quot;,&quot;session&quot;:{&quot;id&quot;:&quot;1.1690489910.1690489918.20&quot;,&quot;expire_duration&quot;:300,&quot;expire_duration_dispersion&quot;:[5000,10000],&quot;enable_refresh&quot;:true,&quot;parsed_session&quot;:{&quot;version&quot;:1,&quot;id&quot;:1690489910,&quot;updated&quot;:1690489918,&quot;number&quot;:20},&quot;is_renew_session&quot;:false},&quot;username&quot;:&quot;Unregistered&quot;,&quot;iq&quot;:&quot;&quot;,&quot;contributorPower&quot;:false,&quot;is_bot&quot;:false},&quot;isOfficeUser&quot;:false,&quot;isOfficeRequest&quot;:false,&quot;isWebp&quot;:false,&quot;isBot&quot;:false,&quot;is_mobile&quot;:false,&quot;is_tablet&quot;:false,&quot;isThemeMobile&quot;:false,&quot;isIe&quot;:false,&quot;isEs6&quot;:false,&quot;socketCluster&quot;:{&quot;serviceKey&quot;:&quot;f0557aa8-2d06-43d9-9c16-f885bc710b97:main&quot;,&quot;channelPrefix&quot;:&quot;f0557aa8-2d06-43d9-9c16-f885bc710b97:main#prod&quot;,&quot;hostname&quot;:&quot;socketcluster.k8s.wsmgroup.ru&quot;,&quot;port&quot;:443,&quot;channelName&quot;:&quot;e2b911c3d39e5e206f13c6dab0ac7bcc&quot;},&quot;metricaId&quot;:18746557,&quot;captcha_id&quot;:&quot;6LfCo_8SAAAAALEMHnlK18j8IemlAdvmxwRnQe2v&quot;,&quot;stripeApiKey&quot;:&quot;pk_live_4aZVHgEcj68d3uAgtisiXtZo&quot;,&quot;country&quot;:&quot;ES&quot;,&quot;countryCode&quot;:&quot;ES&quot;,&quot;browserName&quot;:&quot;&quot;,&quot;os&quot;:&quot;iOS&quot;,&quot;platform&quot;:2,&quot;browser&quot;:&quot;{\&quot;os\&quot;:{\&quot;name\&quot;:\&quot;iOS\&quot;},\&quot;device\&quot;:{\&quot;type\&quot;:\&quot;mobile\&quot;,\&quot;subtype\&quot;:\&quot;smart\&quot;,\&quot;manufacturer\&quot;:\&quot;Apple\&quot;}}&quot;,&quot;urlUgProAppIcon&quot;:&quot;https://tabs.ultimate-guitar.com/static/public/img/app_icons/icon_ug_pro_ver1690485550.png&quot;,&quot;withCritical&quot;:false,&quot;analytics&quot;:{&quot;userTrackerId&quot;:&quot;SA==&quot;},&quot;braintree&quot;:{&quot;environment&quot;:&quot;production&quot;,&quot;tokenizationKey&quot;:&quot;production_8htvrhhr_67vpx3rpxt6m5z7c&quot;,&quot;paypalClientId&quot;:&quot;ASwoeikdyflPIKFAC3U34ewfFVRE5-_p6qc1TTQG9g_sHNs3RP5Sq3pE_e7V2p0VTi-nJQuIA5ApP1XH&quot;,&quot;googlePayClientId&quot;:&quot;BCR2DN6TZPEKBZBZ&quot;},&quot;vimeo&quot;:{&quot;baseImagePath&quot;:&quot;https://cdn.ustatik.com/s3/ug.video.warm/preview/&quot;},&quot;hasStaticCache&quot;:0,&quot;rtAnalytics&quot;:{&quot;trackUrl&quot;:&quot;/components/ab/event&quot;,&quot;trackingEnabled&quot;:true,&quot;forceSendEvents&quot;:[&quot;Tab Favorite Add Click&quot;,&quot;Tab Rate Click&quot;,&quot;Tab View&quot;,&quot;Tab View 12s&quot;,&quot;Tab View 60s&quot;,&quot;Tab View 120s&quot;,&quot;Tab View 180s&quot;],&quot;tabToolLogging&quot;:true,&quot;samplerHeartbeat&quot;:5},&quot;xtz&quot;:{&quot;isActive&quot;:true,&quot;hasAccess&quot;:true,&quot;canToggle&quot;:false,&quot;feedbackChannel&quot;:null},&quot;jinba&quot;:{&quot;customTimings&quot;:[],&quot;appLabel&quot;:&quot;tab_page_text&quot;,&quot;appLabelExp&quot;:&quot;null&quot;},&quot;metricaParams&quot;:{&quot;rights&quot;:0,&quot;proRights&quot;:0,&quot;coursesRights&quot;:0,&quot;singRights&quot;:0,&quot;u_id&quot;:&quot;SA==&quot;,&quot;auth&quot;:&quot;None&quot;,&quot;is_registered&quot;:0,&quot;ab&quot;:{&quot;2681&quot;:1,&quot;2801&quot;:2,&quot;3005&quot;:2,&quot;3017&quot;:2,&quot;3020&quot;:1,&quot;3037&quot;:1,&quot;3040&quot;:1,&quot;725&quot;:2,&quot;824&quot;:2,&quot;857&quot;:2,&quot;902&quot;:2,&quot;923&quot;:2,&quot;947&quot;:1,&quot;950&quot;:2,&quot;956&quot;:1,&quot;965&quot;:1,&quot;992&quot;:2,&quot;1430&quot;:3,&quot;1433&quot;:2,&quot;1436&quot;:2,&quot;1483&quot;:2,&quot;1492&quot;:2,&quot;1495&quot;:2,&quot;1522&quot;:2,&quot;1615&quot;:2,&quot;1618&quot;:2,&quot;1678&quot;:2,&quot;1750&quot;:2,&quot;1765&quot;:2,&quot;1816&quot;:2,&quot;1966&quot;:3,&quot;2084&quot;:2,&quot;2150&quot;:1,&quot;2153&quot;:2,&quot;2225&quot;:1,&quot;2513&quot;:3,&quot;2948&quot;:2}}},&quot;store&quot;:{&quot;page&quot;:{&quot;data&quot;:{&quot;mobile_device&quot;:null,&quot;show_rate_layer&quot;:false,&quot;tab&quot;:{&quot;id&quot;:1757683,&quot;song_id&quot;:317229,&quot;song_name&quot;:&quot;Decoherence&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Tabs&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:0,&quot;rating&quot;:0,&quot;date&quot;:&quot;1438942010&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:17431,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;,&quot;date_update&quot;:&quot;1439212968&quot;,&quot;user_id&quot;:9630691,&quot;user_iq&quot;:114,&quot;username&quot;:&quot;PUNC4KE&quot;,&quot;type_name&quot;:&quot;Tab&quot;,&quot;best_pro_tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-guitar-pro-1487762&quot;},&quot;backing_track_tip&quot;:false,&quot;tab_view&quot;:{&quot;wiki_tab&quot;:{&quot;content&quot;:&quot;-------------------------------------------------------------------------------\r\n                             DECOHERENCE - INSOMNIUM\r\n-------------------------------------------------------------------------------\r\nTabbed by: PUNC4KE\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------10------10-8-------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9----------9---|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7------7---7-|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8---------------------------------------|\r\nB|------------------------------------------------------11---------11-10----------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9---------------------12----|\r\nD|-----------------------------------------------------------12-------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----10----10-------10----10-|\r\nE|--------------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|-------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8-----------------------------------|\r\nG|------------------------------------------------------------------9---9---9-10---9---|\r\nD|-------12----12----12-------12----12----12-----------10---10---10--------------------|\r\nA|-------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8---8------8---8-|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------10------10-8-------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9----------9---|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7------7---7-|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8-------------8------------------|\r\nB|-------------------------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9-----9---9---9-9-10-|\r\nD|-------------------------------------------------------------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----7---7---7--------|\r\nE|-------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|-8----------------8---------------------8---------------------------------------|\r\nB|------------------------------------------------------11---------11-10----------|\r\nG|-----10---10---10-----10---10---10---10-----9---9---9---------------------12----|\r\nD|-----------------------------------------------------------12-------------------|\r\nA|---8----8----8------8----8----8----8------7---7---7-----10----10-------10----10-|\r\nE|--------------------------------------------------------------------------------|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|----------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8----------------8---------------------|\r\nG|----------------------------------------------------------------------------------------|\r\nD|-------12----12----12-------12----12----12-----------10---10---10-----10---10---10---12-|\r\nA|----------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8----8----8----8----|[/tab]\r\n\r\n[tab]e|-------------------------------------------------------------------------------------|\r\nB|-10-------------------10----------------------10-8-----------------------------------|\r\nG|------------------------------------------------------------------9---9---9-10---9---|\r\nD|-------12----12----12-------12----12----12-----------10---10---10--------------------|\r\nA|-------------------------------------------------------------------------------------|\r\nE|----10----10----10-------10----10----10----10------8----8----8------8---8------8---8-|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|---------------------------------------------------------------------------|\r\nB|-8----------------8--------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9---------------|\r\nD|---------------------------------------------------------------10---10---7-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7-------------|\r\nE|------------------------------------------------------------------8----8---|[/tab]\r\n\r\n[tab]e|------------------------------------------------------------------------------|\r\nB|-8----------------8-----------------------------------------------------------|\r\nG|-----10---10---10-----10---10---10---9-10---9---9---9-10---9------------------|\r\nD|---------------------------------------------------------------10---10---7-10-|\r\nA|---8----8----8------8----8----8----8------7---7---7------7---7----------------|\r\nE|------------------------------------------------------------------8----8------|[/tab]&quot;,&quot;revision_id&quot;:2,&quot;user_id&quot;:9630691,&quot;username&quot;:&quot;PUNC4KE&quot;,&quot;date&quot;:1439227368},&quot;contributors&quot;:[],&quot;strummings&quot;:[],&quot;has_hq_description&quot;:0,&quot;blocked&quot;:false,&quot;adsupp_binary_blocked&quot;:null,&quot;meta&quot;:{&quot;difficulty&quot;:&quot;intermediate&quot;},&quot;has_official_version&quot;:true,&quot;has_chord_pro&quot;:false,&quot;has_preset&quot;:false,&quot;versions&quot;:[{&quot;id&quot;:2214683,&quot;song_id&quot;:317229,&quot;song_name&quot;:&quot;Decoherence&quot;,&quot;artist_id&quot;:13302,&quot;artist_name&quot;:&quot;Insomnium&quot;,&quot;type&quot;:&quot;Official&quot;,&quot;part&quot;:&quot;&quot;,&quot;version&quot;:1,&quot;votes&quot;:8,&quot;rating&quot;:4.854910000000000280806489172391593456268310546875,&quot;date&quot;:&quot;1508759843&quot;,&quot;status&quot;:&quot;approved&quot;,&quot;preset_id&quot;:17431,&quot;tab_access_type&quot;:&quot;public&quot;,&quot;tp_version&quot;:0,&quot;tonality_name&quot;:&quot;Dm&quot;,&quot;version_description&quot;:null,&quot;verified&quot;:0,&quot;recording&quot;:{&quot;is_acoustic&quot;:0,&quot;tonality_name&quot;:&quot;&quot;,&quot;performance&quot;:null,&quot;recording_artists&quot;:[]},&quot;artist_url&quot;:&quot;https://www.ultimate-guitar.com/artist/insomnium_13302&quot;,&quot;tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-official-2214683&quot;,&quot;date_update&quot;:&quot;1508759843&quot;,&quot;user_id&quot;:15662368,&quot;user_iq&quot;:60,&quot;username&quot;:&quot;Feroneded&quot;,&quot;type_name&quot;:&quot;Official&quot;,&quot;best_pro_tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-guitar-pro-1487762&quot;}],&quot;song_image&quot;:false,&quot;applicature&quot;:null,&quot;piano_inversions&quot;:null,&quot;last_comments&quot;:[{&quot;id&quot;:5480727,&quot;rowid&quot;:1757683,&quot;text&quot;:&quot;I&rsquo;ve tried this tab and it&rsquo;s the right notes for the most part but I can&rsquo;t get it to sound like the song.&quot;,&quot;author_userid&quot;:9630691,&quot;rating&quot;:0,&quot;userid&quot;:7812739,&quot;usergroupid&quot;:12,&quot;username&quot;:&quot;mascara70&quot;,&quot;date_created&quot;:1524752963,&quot;type&quot;:4,&quot;parent_id&quot;:0,&quot;added_from&quot;:&quot;mobile&quot;,&quot;updated_at&quot;:null,&quot;status&quot;:&quot;new&quot;,&quot;moderator_user_id&quot;:11009608,&quot;likes_count&quot;:0,&quot;dislikes_count&quot;:0,&quot;contributor_level&quot;:null,&quot;avatar&quot;:&quot;https://tabs.ultimate-guitar.com/static/users/9/3/7/7812739.gif?d=d&quot;,&quot;date&quot;:1524752963,&quot;user_iq&quot;:10}],&quot;comments&quot;:1,&quot;stats&quot;:{&quot;view_total&quot;:1346,&quot;favorites_count&quot;:11},&quot;tab_corrects&quot;:[],&quot;is_simplify_available&quot;:false,&quot;can_edit_tab&quot;:false,&quot;can_edit_strumming&quot;:false,&quot;can_send_tab_stats&quot;:true,&quot;official_backingtrack&quot;:null,&quot;tab_search_link&quot;:&quot;https://www.ultimate-guitar.com/search.php?band_name=Insomnium&amp;song_name=decoherence&amp;type%5B0%5D=200&amp;type%5B1%5D=300&quot;,&quot;wiki_tab_user_group_id&quot;:21,&quot;wiki_tab_user_iq&quot;:114,&quot;user_group_id&quot;:21,&quot;count_rating&quot;:1,&quot;encode_strummings&quot;:&quot;&quot;,&quot;alert&quot;:null,&quot;official_backingtrack_url&quot;:&quot;https://www.ultimate-guitar.com/backing_track/insomnium/decoherence_32507&quot;,&quot;official_tab_url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-official-2214683&quot;,&quot;official_tab_want&quot;:null,&quot;tab_manually_highlighted&quot;:false,&quot;pro_tab_onbording&quot;:null,&quot;smart_auto_scroll_available&quot;:false,&quot;lyrics_lines&quot;:[],&quot;video_feed&quot;:{&quot;total_count&quot;:0,&quot;artist_total_count&quot;:16},&quot;ug_difficulty&quot;:&quot;intermediate&quot;,&quot;new_ug_difficulty&quot;:null,&quot;tracking&quot;:{&quot;ctx&quot;:{&quot;user_registered&quot;:0,&quot;url&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;,&quot;referer&quot;:&quot;&quot;,&quot;utm_source&quot;:&quot;&quot;,&quot;utm_medium&quot;:&quot;&quot;,&quot;utm_campaign&quot;:&quot;&quot;,&quot;utm_content&quot;:&quot;&quot;,&quot;utm_term&quot;:&quot;&quot;,&quot;tab_id&quot;:1757683,&quot;tab_type&quot;:&quot;Tabs&quot;,&quot;tab_created&quot;:1438942010,&quot;tab_open_source&quot;:&quot;&quot;,&quot;tab_views&quot;:1346,&quot;tab_favourites_count&quot;:11,&quot;tab_version&quot;:1,&quot;tab_ratings_count&quot;:0,&quot;tab_rating&quot;:0,&quot;tab_ug_difficulty&quot;:&quot;intermediate&quot;,&quot;tab_author_difficulty&quot;:&quot;intermediate&quot;,&quot;song_id&quot;:317229,&quot;song_artist_id&quot;:13302,&quot;h&quot;:223132457,&quot;dt&quot;:1690489918}},&quot;brothers_by_type&quot;:null,&quot;brothers_count&quot;:null},&quot;access&quot;:{&quot;can_edit_tab&quot;:false,&quot;can_edit_strumming&quot;:false,&quot;can_delete_comment&quot;:false,&quot;can_manage_rating&quot;:false,&quot;can_vote_strumming&quot;:true},&quot;recommended_tabs&quot;:[],&quot;recentry_viewed_key&quot;:&quot;tab:1757683&quot;,&quot;criticals&quot;:[],&quot;online&quot;:{&quot;users&quot;:5919,&quot;guests&quot;:1360},&quot;is_in_linking_exp&quot;:true},&quot;header_bidding&quot;:{&quot;page_type&quot;:&quot;tab_desktop&quot;,&quot;ad_units&quot;:[{&quot;code&quot;:&quot;ad_cs_2010320_160_600&quot;,&quot;dfpCode&quot;:&quot;UG_ATF_160&quot;,&quot;sizes&quot;:[[160,600]],&quot;placementId&quot;:&quot;7478445&quot;,&quot;layoutPlacement&quot;:&quot;side&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[160,600]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;appnexusPlacementId&quot;:12097756,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:7478445,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;239223&quot;,&quot;adxDomain&quot;:&quot;adx.adform.net&quot;}},{&quot;bidder&quot;:&quot;openx&quot;,&quot;params&quot;:{&quot;delDomain&quot;:&quot;ultimate-guitar-d.openx.net&quot;,&quot;unit&quot;:&quot;538591659&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131193&quot;}},{&quot;bidder&quot;:&quot;rubicon&quot;,&quot;params&quot;:{&quot;accountId&quot;:&quot;15178&quot;,&quot;siteId&quot;:&quot;93918&quot;,&quot;zoneId&quot;:&quot;441926&quot;}},{&quot;bidder&quot;:&quot;ix&quot;,&quot;params&quot;:{&quot;id&quot;:1,&quot;siteId&quot;:&quot;177325&quot;}},{&quot;bidder&quot;:&quot;sharethrough&quot;,&quot;params&quot;:{&quot;pkey&quot;:&quot;2DMGYqOnPeq1qmyOc10E0J7p&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1}},{&quot;code&quot;:&quot;ad_cs_2010319_160_600&quot;,&quot;dfpCode&quot;:&quot;UG_BTFR_160&quot;,&quot;sizes&quot;:[[160,600]],&quot;placementId&quot;:&quot;7478445&quot;,&quot;layoutPlacement&quot;:&quot;sideBottom&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[160,600]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;appnexusPlacementId&quot;:12097784,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:7478445,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;849559&quot;,&quot;adxDomain&quot;:&quot;adx.adform.net&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131225&quot;}},{&quot;bidder&quot;:&quot;ix&quot;,&quot;params&quot;:{&quot;siteId&quot;:&quot;179682&quot;,&quot;id&quot;:&quot;03&quot;}},{&quot;bidder&quot;:&quot;sharethrough&quot;,&quot;params&quot;:{&quot;pkey&quot;:&quot;4wvqxnlPv0OVn60kXMsmh12M&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1}},{&quot;code&quot;:&quot;ad_cs_2010319_300_250&quot;,&quot;dfpCode&quot;:&quot;UG_BTFR_300&quot;,&quot;sizes&quot;:[[1,1]],&quot;placementId&quot;:&quot;8549997&quot;,&quot;layoutPlacement&quot;:&quot;bottom&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[1,1],[300,250],[610,300],[535,300],[535,400]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;withoutBids&quot;:true,&quot;appnexusPlacementId&quot;:12097784,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:8549997,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;239226&quot;}},{&quot;bidder&quot;:&quot;openx&quot;,&quot;params&quot;:{&quot;delDomain&quot;:&quot;ultimate-guitar-d.openx.net&quot;,&quot;unit&quot;:&quot;538591661&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131198@300x250&quot;}},{&quot;bidder&quot;:&quot;rubicon&quot;,&quot;params&quot;:{&quot;accountId&quot;:&quot;15178&quot;,&quot;siteId&quot;:&quot;93918&quot;,&quot;zoneId&quot;:&quot;491160&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1},&quot;primis&quot;:true,&quot;dynamic&quot;:true}]},&quot;experiments&quot;:{&quot;variations&quot;:{&quot;2681&quot;:1,&quot;2801&quot;:2,&quot;3005&quot;:2,&quot;3017&quot;:2,&quot;3020&quot;:1,&quot;3037&quot;:1,&quot;3040&quot;:1,&quot;725&quot;:2,&quot;824&quot;:2,&quot;857&quot;:2,&quot;902&quot;:2,&quot;923&quot;:2,&quot;947&quot;:1,&quot;950&quot;:2,&quot;956&quot;:1,&quot;965&quot;:1,&quot;992&quot;:2,&quot;1430&quot;:3,&quot;1433&quot;:2,&quot;1436&quot;:2,&quot;1483&quot;:2,&quot;1492&quot;:2,&quot;1495&quot;:2,&quot;1522&quot;:2,&quot;1615&quot;:2,&quot;1618&quot;:2,&quot;1678&quot;:2,&quot;1750&quot;:2,&quot;1765&quot;:2,&quot;1816&quot;:2,&quot;1966&quot;:3,&quot;2084&quot;:2,&quot;2150&quot;:1,&quot;2153&quot;:2,&quot;2225&quot;:1,&quot;2513&quot;:3,&quot;2948&quot;:2},&quot;closed_experiments&quot;:{&quot;725&quot;:2,&quot;824&quot;:2,&quot;857&quot;:2,&quot;902&quot;:2,&quot;923&quot;:2,&quot;947&quot;:1,&quot;950&quot;:2,&quot;956&quot;:1,&quot;965&quot;:1,&quot;992&quot;:2,&quot;1430&quot;:3,&quot;1433&quot;:2,&quot;1436&quot;:2,&quot;1483&quot;:2,&quot;1492&quot;:2,&quot;1495&quot;:2,&quot;1522&quot;:2,&quot;1615&quot;:2,&quot;1618&quot;:2,&quot;1678&quot;:2,&quot;1750&quot;:2,&quot;1765&quot;:2,&quot;1816&quot;:2,&quot;1966&quot;:3,&quot;2084&quot;:2,&quot;2150&quot;:1,&quot;2153&quot;:2,&quot;2225&quot;:1,&quot;2513&quot;:3,&quot;2948&quot;:2}},&quot;template&quot;:{&quot;module&quot;:&quot;tab&quot;,&quot;controller&quot;:&quot;view&quot;,&quot;action&quot;:&quot;index&quot;,&quot;reactAction&quot;:&quot;tab_text&quot;},&quot;documents&quot;:{&quot;enabled&quot;:true}},&quot;i18n&quot;:{&quot;language&quot;:&quot;en&quot;,&quot;links&quot;:{&quot;default&quot;:&quot;https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;,&quot;pt&quot;:&quot;https://pt.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;,&quot;es&quot;:&quot;https://es.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683&quot;},&quot;isLocalizationDomain&quot;:false},&quot;promotion&quot;:{&quot;promoKey&quot;:&quot;ugapp:topBannerShow:Summersale2023&quot;,&quot;promoType&quot;:&quot;Summer&quot;,&quot;endedKey&quot;:&quot;_ug_promotionEnded_v4&quot;,&quot;emergency&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/7/7bcbdf234b3f68a208985575259d8f7b22c3ff8b.webp&quot;,&quot;title&quot;:&quot;Summer Sale&quot;},&quot;exit&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/7/757d514209eae5d7227ca7ac4cad88784ab8685e.webp&quot;,&quot;title&quot;:&quot;SUMMER SALE&quot;,&quot;subtitle&quot;:&quot;&quot;,&quot;hasLabel&quot;:false,&quot;hasTimer&quot;:false},&quot;heroBanner&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/b/b1cc041634b0f46d4fbccdf2d7bb2a94dee2fe39.webp&quot;,&quot;title&quot;:&quot;&quot;,&quot;subtitle&quot;:&quot;SUMMER SALE&quot;},&quot;heroBlock&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/c/c720d37487014a3fa8189adea71f7d1addbc4855.webp&quot;},&quot;payment&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/f/fa31a31311b61e5c080be48ba88e464b5f0cd541.webp&quot;,&quot;title&quot;:&quot;SUMMER\nSALE&quot;,&quot;planName&quot;:&quot;Summer sale&quot;},&quot;permBanner&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/f/f2b964381ba69f1fa9058c2776f10eb47bdfc1f9.webp&quot;,&quot;title&quot;:&quot;&quot;,&quot;subtitle&quot;:&quot;Pro Access&quot;,&quot;hasTimer&quot;:true,&quot;endedSubscriptionText&quot;:&quot;Welcome offer: %percentage% OFF on an annual membership of Ultimate Guitar Pro&quot;,&quot;cardProblemText&quot;:&quot;Card you used to subscribe has expired. Please update your payment information to continue enjoying Ultimate Guitar&quot;,&quot;paymentProblemText&quot;:&quot;We were unable to renew your premium subscription. Please top-up card balance&quot;},&quot;stickyBanner&quot;:{&quot;imgUrl&quot;:&quot;https://www.ultimate-guitar.com/static/storage/marketing/images/7/7dfafc3a558a64cc6003568c376321db71eb7173.webp&quot;,&quot;title&quot;:&quot;&quot;,&quot;subtitle&quot;:&quot;SUMMER SALE!&quot;}},&quot;user&quot;:{&quot;id&quot;:0,&quot;pa_id&quot;:0,&quot;avatarUrl&quot;:&quot;https://tabs.ultimate-guitar.com/static/users/0/0/0/0.gif?d=d&amp;h=1690489913&quot;,&quot;username&quot;:&quot;Unregistered&quot;,&quot;email&quot;:&quot;&quot;,&quot;usergroupid&quot;:0,&quot;contributor&quot;:{&quot;isContributor&quot;:false,&quot;isTabContributor&quot;:false,&quot;first_tab&quot;:0},&quot;iq&quot;:0,&quot;tabsCount&quot;:0,&quot;playlistCount&quot;:0,&quot;coursesCount&quot;:0,&quot;messagesCount&quot;:0,&quot;rights&quot;:[],&quot;hasExpiredCard&quot;:null,&quot;hasChargeError&quot;:null,&quot;hasActiveProPause&quot;:false,&quot;hasActiveEduPause&quot;:false,&quot;tab_try&quot;:null,&quot;content_access&quot;:[],&quot;joinDate&quot;:0,&quot;user_status&quot;:&quot;&quot;,&quot;segment&quot;:{&quot;preview&quot;:null,&quot;current&quot;:{&quot;segment&quot;:8,&quot;prediction&quot;:1,&quot;group_segment&quot;:3,&quot;segment_label&quot;:&quot;core_buyers_from_first_visits&quot;,&quot;group_segment_label&quot;:&quot;core_paying&quot;}},&quot;uid2_token_url&quot;:null,&quot;ip&quot;:&quot;37.223.69.136&quot;,&quot;id5_hashed&quot;:&quot;&quot;},&quot;notifications&quot;:{&quot;count_new&quot;:0,&quot;data&quot;:[],&quot;giveaway_id&quot;:0,&quot;texts&quot;:{&quot;markAll&quot;:&quot;Mark all as read&quot;,&quot;settings&quot;:&quot;Settings&quot;,&quot;thanksForVote&quot;:&quot;Thanks for your vote&quot;}},&quot;forms&quot;:[],&quot;theme&quot;:&quot;dark&quot;,&quot;commentForm&quot;:{&quot;is_new&quot;:0},&quot;isUgOffice&quot;:0,&quot;ugSearch&quot;:{&quot;type&quot;:&quot;tabs&quot;,&quot;value&quot;:&quot;&quot;},&quot;sponsorsFooter&quot;:null,&quot;takeover&quot;:{&quot;items&quot;:[],&quot;debug_takeover_id&quot;:0},&quot;interstitial&quot;:false,&quot;customAlerts&quot;:[]},&quot;globalHelpers&quot;:[],&quot;helpers&quot;:{&quot;typeHelper&quot;:{&quot;short&quot;:{&quot;Official&quot;:&quot;OFFICIAL&quot;,&quot;Chords&quot;:&quot;CRD&quot;,&quot;Tabs&quot;:&quot;TAB&quot;,&quot;Pro&quot;:&quot;PRO&quot;,&quot;Power&quot;:&quot;PWR&quot;,&quot;Bass Tabs&quot;:&quot;BASS&quot;,&quot;Drum Tabs&quot;:&quot;DRM&quot;,&quot;Video&quot;:&quot;VID&quot;,&quot;Ukulele Chords&quot;:&quot;UKE&quot;,&quot;Tab Pro&quot;:&quot;TAB PRO&quot;,&quot;Chord Pro&quot;:&quot;CRD PRO&quot;,&quot;Vocal&quot;:&quot;VOCAL&quot;},&quot;filter&quot;:{&quot;Official&quot;:&quot;official&quot;,&quot;Chords&quot;:&quot;chords&quot;,&quot;Tabs&quot;:&quot;tab&quot;,&quot;Pro&quot;:&quot;guitar pro&quot;,&quot;Power&quot;:&quot;power&quot;,&quot;Bass Tabs&quot;:&quot;bass&quot;,&quot;Drum Tabs&quot;:&quot;drums&quot;,&quot;Video&quot;:&quot;video&quot;,&quot;Ukulele Chords&quot;:&quot;ukulele&quot;,&quot;Tab Pro&quot;:&quot;tab pro&quot;,&quot;Chord Pro&quot;:&quot;chord pro&quot;,&quot;Vocal&quot;:&quot;vocal&quot;},&quot;full&quot;:{&quot;Official&quot;:&quot;official tab&quot;,&quot;Chords&quot;:&quot;chords&quot;,&quot;Tabs&quot;:&quot;tab&quot;,&quot;Pro&quot;:&quot;guitar pro tab&quot;,&quot;Power&quot;:&quot;power tab&quot;,&quot;Bass Tabs&quot;:&quot;bass tab&quot;,&quot;Drum Tabs&quot;:&quot;drum tab&quot;,&quot;Video&quot;:&quot;video tab&quot;,&quot;Ukulele Chords&quot;:&quot;ukulele chords&quot;,&quot;Tab Pro&quot;:&quot;tab pro&quot;,&quot;Chord Pro&quot;:&quot;chord pro&quot;,&quot;Vocal&quot;:&quot;vocal tab&quot;},&quot;recommendations&quot;:{&quot;Official&quot;:&quot;Official&quot;,&quot;Chords&quot;:&quot;Chords&quot;,&quot;Tabs&quot;:&quot;Tab&quot;,&quot;Pro&quot;:&quot;Pro&quot;,&quot;Power&quot;:&quot;Power&quot;,&quot;Bass Tabs&quot;:&quot;Bass&quot;,&quot;Drum Tabs&quot;:&quot;Drum&quot;,&quot;Video&quot;:&quot;Video&quot;,&quot;Ukulele Chords&quot;:&quot;Ukulele&quot;,&quot;Tab Pro&quot;:&quot;Tab Pro&quot;,&quot;Chord Pro&quot;:&quot;Chord&quot;,&quot;Vocal&quot;:&quot;Vocal&quot;}}},&quot;cmp&quot;:{&quot;setConsentUrl&quot;:&quot;https://www.ultimate-guitar.com/user/security/consent&quot;},&quot;bidding&quot;:{&quot;analytics&quot;:{&quot;logUrl&quot;:&quot;//track.ultimate-guitar.com/ug/&quot;,&quot;pageType&quot;:&quot;tab_desktop&quot;,&quot;region&quot;:&quot;CEE&quot;,&quot;device&quot;:&quot;desktop&quot;,&quot;variation&quot;:&quot;&quot;,&quot;hasHardRefresh&quot;:true},&quot;refresh&quot;:{&quot;limit&quot;:30,&quot;maxVisibleTime&quot;:1000,&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;enabled&quot;:true,&quot;hasHardRefresh&quot;:true,&quot;availableBidders&quot;:[&quot;appnexus&quot;,&quot;ix&quot;,&quot;pubmatic&quot;,&quot;rubicon&quot;,&quot;openx&quot;,&quot;adform&quot;,&quot;sharethrough&quot;],&quot;ignoreChangePageVisibility&quot;:false},&quot;minRefreshCpm&quot;:0.040000000000000000832667268468867405317723751068115234375,&quot;cpmFloor&quot;:0.1000000000000000055511151231257827021181583404541015625,&quot;timeout&quot;:2000,&quot;refreshTimeout&quot;:2000,&quot;dfpId&quot;:74268401,&quot;units&quot;:[{&quot;code&quot;:&quot;ad_cs_2010320_160_600&quot;,&quot;dfpCode&quot;:&quot;UG_ATF_160&quot;,&quot;sizes&quot;:[[160,600]],&quot;placementId&quot;:&quot;7478445&quot;,&quot;layoutPlacement&quot;:&quot;side&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[160,600]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;appnexusPlacementId&quot;:12097756,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:7478445,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;239223&quot;,&quot;adxDomain&quot;:&quot;adx.adform.net&quot;}},{&quot;bidder&quot;:&quot;openx&quot;,&quot;params&quot;:{&quot;delDomain&quot;:&quot;ultimate-guitar-d.openx.net&quot;,&quot;unit&quot;:&quot;538591659&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131193&quot;}},{&quot;bidder&quot;:&quot;rubicon&quot;,&quot;params&quot;:{&quot;accountId&quot;:&quot;15178&quot;,&quot;siteId&quot;:&quot;93918&quot;,&quot;zoneId&quot;:&quot;441926&quot;}},{&quot;bidder&quot;:&quot;ix&quot;,&quot;params&quot;:{&quot;id&quot;:1,&quot;siteId&quot;:&quot;177325&quot;}},{&quot;bidder&quot;:&quot;sharethrough&quot;,&quot;params&quot;:{&quot;pkey&quot;:&quot;2DMGYqOnPeq1qmyOc10E0J7p&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1}},{&quot;code&quot;:&quot;ad_cs_2010319_160_600&quot;,&quot;dfpCode&quot;:&quot;UG_BTFR_160&quot;,&quot;sizes&quot;:[[160,600]],&quot;placementId&quot;:&quot;7478445&quot;,&quot;layoutPlacement&quot;:&quot;sideBottom&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[160,600]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;appnexusPlacementId&quot;:12097784,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:7478445,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;849559&quot;,&quot;adxDomain&quot;:&quot;adx.adform.net&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131225&quot;}},{&quot;bidder&quot;:&quot;ix&quot;,&quot;params&quot;:{&quot;siteId&quot;:&quot;179682&quot;,&quot;id&quot;:&quot;03&quot;}},{&quot;bidder&quot;:&quot;sharethrough&quot;,&quot;params&quot;:{&quot;pkey&quot;:&quot;4wvqxnlPv0OVn60kXMsmh12M&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1}},{&quot;code&quot;:&quot;ad_cs_2010319_300_250&quot;,&quot;dfpCode&quot;:&quot;UG_BTFR_300&quot;,&quot;sizes&quot;:[[1,1]],&quot;placementId&quot;:&quot;8549997&quot;,&quot;layoutPlacement&quot;:&quot;bottom&quot;,&quot;mediaTypes&quot;:{&quot;banner&quot;:{&quot;sizes&quot;:[[1,1],[300,250],[610,300],[535,300],[535,400]]}},&quot;refresh&quot;:{&quot;delay&quot;:30000,&quot;delayDeviation&quot;:10000,&quot;maxVisibleTime&quot;:1000,&quot;limit&quot;:30},&quot;withoutBids&quot;:true,&quot;appnexusPlacementId&quot;:12097784,&quot;mediaType&quot;:&quot;banner&quot;,&quot;bids&quot;:[{&quot;bidder&quot;:&quot;appnexus&quot;,&quot;params&quot;:{&quot;placementId&quot;:8549997,&quot;keywords&quot;:{&quot;is_refresh&quot;:&quot;false&quot;,&quot;artist&quot;:13302,&quot;tab_id&quot;:1757683,&quot;instr&quot;:&quot;guitar&quot;,&quot;title&quot;:&quot;Insomnium - Decoherence (tab)&quot;}}},{&quot;bidder&quot;:&quot;adform&quot;,&quot;params&quot;:{&quot;mid&quot;:&quot;239226&quot;}},{&quot;bidder&quot;:&quot;openx&quot;,&quot;params&quot;:{&quot;delDomain&quot;:&quot;ultimate-guitar-d.openx.net&quot;,&quot;unit&quot;:&quot;538591661&quot;}},{&quot;bidder&quot;:&quot;pubmatic&quot;,&quot;params&quot;:{&quot;publisherId&quot;:&quot;72623&quot;,&quot;adSlot&quot;:&quot;3131198@300x250&quot;}},{&quot;bidder&quot;:&quot;rubicon&quot;,&quot;params&quot;:{&quot;accountId&quot;:&quot;15178&quot;,&quot;siteId&quot;:&quot;93918&quot;,&quot;zoneId&quot;:&quot;491160&quot;}}],&quot;customTargeting&quot;:{&quot;ab_var_web_UG_2801&quot;:2,&quot;ab_var_web_UG_3005&quot;:2,&quot;ab_var_web_UG_3017&quot;:2,&quot;ab_var_web_UG_3020&quot;:1,&quot;ab_var_web_UG_3037&quot;:1},&quot;primis&quot;:true,&quot;dynamic&quot;:true}],&quot;priceGranularity&quot;:[{&quot;precision&quot;:2,&quot;min&quot;:0,&quot;max&quot;:1,&quot;increment&quot;:0.01000000000000000020816681711721685132943093776702880859375},{&quot;precision&quot;:2,&quot;min&quot;:1,&quot;max&quot;:2,&quot;increment&quot;:0.0200000000000000004163336342344337026588618755340576171875},{&quot;precision&quot;:2,&quot;min&quot;:2,&quot;max&quot;:5,&quot;increment&quot;:0.05000000000000000277555756156289135105907917022705078125},{&quot;precision&quot;:2,&quot;min&quot;:5,&quot;max&quot;:10,&quot;increment&quot;:0.1000000000000000055511151231257827021181583404541015625},{&quot;precision&quot;:2,&quot;min&quot;:10,&quot;max&quot;:20,&quot;increment&quot;:0.200000000000000011102230246251565404236316680908203125},{&quot;precision&quot;:2,&quot;min&quot;:20,&quot;max&quot;:50,&quot;increment&quot;:0.5}],&quot;dynamicLoad&quot;:true,&quot;disableAdx&quot;:false,&quot;isGDPRAvailable&quot;:true,&quot;isShowOnTap&quot;:false,&quot;showMePlayer&quot;:false,&quot;adsTargeting&quot;:{&quot;song&quot;:&quot;Decoherence&quot;,&quot;artist&quot;:&quot;Insomnium&quot;,&quot;tab_subtype&quot;:&quot;&quot;},&quot;prebidLibUrl&quot;:&quot;https://tabs.ultimate-guitar.com/static/public/build/prebid_7_40_0/prebid_ver1690485550.js&quot;,&quot;isRegistered&quot;:0,&quot;emailHash&quot;:&quot;e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855&quot;,&quot;slots&quot;:[]}}"></div>
<script defer src='https://tabs.ultimate-guitar.com/static/public/build/ug_react/vendor.7b58a431e6230d809aae4a211ee10b80.js'></script>
    <script defer src='https://tabs.ultimate-guitar.com/static/public/build/ug_react/ug~runtime.baae4f8ca21fe7030c0f9ca00dd7258d.js'></script>    <script defer src='https://tabs.ultimate-guitar.com/static/public/build/ug_react/ug.27f51102319f34cc1b3a9727ffbb22fa.js'></script><script type="text/javascript">

// GA start
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//tabs.ultimate-guitar.com/static/vendor/ga/analytics_ver1690485550.js','ga');

ga('create', 'UA-9160560-1', 'auto');

    
ga('set', 'dimension5', 'https');

    
    
    
                ga('create', 'UA-9160560-20', 'auto', {"sampleRate":10,"name":"sampledTracker"});

        
    ga('sampledTracker.set', 'dimension5', 'https');

                        ga('create', 'UA-9160560-18', 'auto', {"name":"reactTracker"});

        
    ga('reactTracker.set', 'dimension5', 'https');

            

var ga_client_id = null;

ga(function(tracker) {
    ga_client_id = tracker.get('clientId');
    ga('set', 'dimension4', ga_client_id);

            ga('sampledTracker.set', 'dimension4', ga.getByName('sampledTracker').get('clientId'));

                var ga_client_id_value = ga.getByName('sampledTracker').get('clientId');
        document.cookie = 'ga_client_id=' + ga_client_id_value + '; path=/; domain=.ultimate-guitar.com';
                    ga('reactTracker.set', 'dimension4', ga.getByName('reactTracker').get('clientId'));

            });

ga('send', 'pageview');
        ga('sampledTracker.send', 'pageview');
        ga('reactTracker.send', 'pageview');
    // GA end

    
        (function (d, w, c) {
    function setCookie(name, value) {
      var options = {}
      options.expires = new Date(new Date().setFullYear(new Date().getFullYear() + 1)).toUTCString();
      options.path = '/'
      options.domain = '.ultimate-guitar.com'
      var updatedCookie = encodeURIComponent(name) + "=" + encodeURIComponent(value);
      for (var optionKey in options) {
        updatedCookie += "; " + optionKey;
        var optionValue = options[optionKey];
        if (optionValue !== true) {
          updatedCookie += "=" + optionValue;
        }
      }
      document.cookie = updatedCookie;
    }
    (w[c] = w[c] || []).push(function() {
        try {
                            w.yaCounter18746557 = new Ya.Metrika({"clickmap":true,"trackLinks":true,"triggerEvent":true,"accurateTrackBounce":true,"ab":{"2681":1,"2801":2,"3005":2,"3017":2,"3020":1,"3037":1,"3040":1,"725":2,"824":2,"857":2,"902":2,"923":2,"947":1,"950":2,"956":1,"965":1,"992":2,"1430":3,"1433":2,"1436":2,"1483":2,"1492":2,"1495":2,"1522":2,"1615":2,"1618":2,"1678":2,"1750":2,"1765":2,"1816":2,"1966":3,"2084":2,"2150":1,"2153":2,"2225":1,"2513":3,"2948":2},"id":18746557,"webvisor":true});

                
                                                                
             var clientId = w.yaCounter18746557.getClientID();

             setCookie('_ug_client_id', clientId)

             var isPwa =  (
                 (window.matchMedia && window.matchMedia('(display-mode: standalone)').matches) ||
                 window.navigator.standalone === true
             );
             var params = {"has_web_pro_access":0,"ab":{"2681":1,"2801":2,"3005":2,"3017":2,"3020":1,"3037":1,"3040":1,"725":2,"824":2,"857":2,"902":2,"923":2,"947":1,"950":2,"956":1,"965":1,"992":2,"1430":3,"1433":2,"1436":2,"1483":2,"1492":2,"1495":2,"1522":2,"1615":2,"1618":2,"1678":2,"1750":2,"1765":2,"1816":2,"1966":3,"2084":2,"2150":1,"2153":2,"2225":1,"2513":3,"2948":2},"uuid":1914592281,"is_registered":0,"rights":0,"u_id":"SA==","type":"Tabs","auth":"None"};
             params.pwa = isPwa ? 1 : 0;
             w.yaCounter18746557.params(params)
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//tabs.ultimate-guitar.com/static/vendor/metrica/watch_ver1690485550.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
    </script>

    <noscript>
        <img src="//mc.yandex.ru/watch/18746557" style="position:absolute; left:-9999px;" alt="" />
    </noscript>
        <script type="application/ld+json">
{
  "@context":"http://schema.org",
  "@type":"MusicRecording",
  "byArtist": {
    "@context":"http://schema.org",
    "@type":"MusicGroup",
    "name":"Insomnium",
    "url":"https://www.ultimate-guitar.com/artist/insomnium_13302"
  },
  "name":"Decoherence",
  "url":"https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683"
  ,"datePublished": "2015-08-07T06:06:50-04:00"
  ,"dateModified": "2015-08-10T13:22:48-04:00"
}
</script>
<script type="application/ld+json">
{
  "@context":"http://schema.org",
  "@type":"CreativeWork",
  "name":"Decoherence"
}
</script>
<script type="application/ld+json">
{
 "@context": "http://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement":
 [
   {
   "@type": "ListItem",
   "position": 1,
   "item":
   {
    "@id": "https://www.ultimate-guitar.com/bands/i.htm",
    "name": "I"
    }
  },
  {
   "@type": "ListItem",
   "position": 2,
   "item":
   {
    "@id": "https://www.ultimate-guitar.com/artist/insomnium_13302",
    "name": "Insomnium"
    }
  },
  {
   "@type": "ListItem",
  "position": 3,
  "item":
   {
     "@id": "https://tabs.ultimate-guitar.com/tab/insomnium/decoherence-tabs-1757683",
     "name": "Decoherence"
   }
  }
 ]
}
</script>
<style>.hide-seo-text{font-size: 0;}</style>
</body>
</html>

"""
        return data
    }
}
