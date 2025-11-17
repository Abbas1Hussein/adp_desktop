'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"index.html": "5e3411bd42f7c12572d3130005a2595d",
"/": "5e3411bd42f7c12572d3130005a2595d",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "0cfee0cb3948dfc72a50a4a7ff7c3ec3",
"assets/lib/src/view/screens/home/tabs/additional/adaptive.dart": "2da0005cb0e49acc3504762b552d9ec8",
"assets/lib/src/view/screens/home/tabs/additional/brightness_typography.dart": "b0672745a37924456a8048d33523f8f8",
"assets/lib/src/view/screens/home/tabs/additional/page_route.dart": "11c350890d899d6ca67529a7cbd22498",
"assets/lib/src/view/screens/home/tabs/additional/colors.dart": "8abd62c6c25fab47ff51648b65f18f7c",
"assets/lib/src/view/screens/home/tabs/additional/additional.dart": "ec671755d8d366b5836873cddffb73e3",
"assets/lib/src/view/screens/home/tabs/icons/icons.dart": "61bd830e582ea40030dfc7154cb9651d",
"assets/lib/src/view/screens/home/tabs/icons/icon_theme.dart": "94897cce82a4704cdd1b4007ca977e8a",
"assets/lib/src/view/screens/home/tabs/icons/icon_all.dart": "e4e57a29c84c92e13e0007f12b23a182",
"assets/lib/src/view/screens/home/tabs/icons/icon.dart": "26aa93c9f87f217406edde8d9da8bd04",
"assets/lib/src/view/screens/home/tabs/icons/icon_button.dart": "e5a947c4831dfac8c4f50b654d5756ec",
"assets/lib/src/view/screens/home/tabs/icons/icon_from.dart": "a5ccf33b25112afb8af48221a5999433",
"assets/lib/src/view/screens/home/tabs/buttons/buttons.dart": "a14e7b43dba9cab93e84f69d075d1312",
"assets/lib/src/view/screens/home/tabs/buttons/basic_buttons.dart": "fedeefc0091789ed0389a6f4c95ee0c6",
"assets/lib/src/view/screens/home/tabs/buttons/menus.dart": "661e31d76326ad8168980736bee6ac3f",
"assets/lib/src/view/screens/home/tabs/buttons/window_control_buttons.dart": "3d1345ce0af894f4fac43ee1cd21b28d",
"assets/lib/src/view/screens/home/tabs/buttons/selection_buttons.dart": "4b625de6ad88e0731fbb8f325e52b164",
"assets/lib/src/view/screens/home/tabs/buttons/navigation_buttons.dart": "003e265f1cefeb4915a251a5be4b331a",
"assets/lib/src/view/screens/home/tabs/surfaces/card.dart": "12cc84da6c1aab34908b0d7f1fb4a804",
"assets/lib/src/view/screens/home/tabs/surfaces/bottom_sheet.dart": "22d7a74f6161c25315d6d9a46133fc0b",
"assets/lib/src/view/screens/home/tabs/surfaces/surfaces.dart": "caa161fdfcd271d54c5e4258becd727f",
"assets/lib/src/view/screens/home/tabs/surfaces/dialog.dart": "8305799a2bd397103de3eec85b480984",
"assets/lib/src/view/screens/home/tabs/surfaces/list_tile.dart": "7689c13312c757ee3b4b129b04c8a187",
"assets/lib/src/view/screens/home/tabs/fields/text_form_field.dart": "7c579bd267aa40f51da57545148ff800",
"assets/lib/src/view/screens/home/tabs/fields/fields.dart": "e2d5410fbf5c498869e3bed161b6dea4",
"assets/lib/src/view/screens/home/tabs/fields/text_field.dart": "610f3342a75e026a5c6bd16cf0b859a2",
"assets/lib/src/view/screens/home/tabs/fields/text_search_field.dart": "32f6f05257c3b179c921faa112b8ddbf",
"assets/lib/src/view/screens/home/tabs/navigation/navigation_view.dart": "14f844c20f7ff81f10ea0356743d7c58",
"assets/lib/src/view/screens/home/tabs/navigation/navigation.dart": "99104e675d4bcdd678de6638c54b5de1",
"assets/lib/src/view/screens/home/tabs/navigation/tab_view.dart": "93fd22ae13d9d49f97496f54ff8fe117",
"assets/lib/src/view/screens/home/tabs/layouts/layouts.dart": "3f0bbcd199cefbdc25a7e66a1af157d4",
"assets/lib/src/view/screens/home/tabs/layouts/title_bar.dart": "b62edf2a2e9c2492eabc48dc9bd16093",
"assets/lib/src/view/screens/home/tabs/layouts/scaffold_page.dart": "19eecaafe96ac2da8630a280aa17a740",
"assets/lib/src/view/screens/home/tabs/layouts/scaffold.dart": "bde4745959300b9793b02d926373b88e",
"assets/lib/src/view/screens/home/tabs/pickers/date_picker.dart": "fb7c4858a46743f2e184e32e985aaab8",
"assets/lib/src/view/screens/home/tabs/pickers/time_picker.dart": "503f0a2202fb24319e321b5b82a17466",
"assets/lib/src/view/screens/home/tabs/pickers/pickers.dart": "8ab4c9d7ee092b52f340b6627c2fa10b",
"assets/lib/src/view/screens/home/tabs/indicators/rating_indicator.dart": "624468a392930edb71206a4b391334e6",
"assets/lib/src/view/screens/home/tabs/indicators/indicators.dart": "8064dc2db5f51aff70a34d073d617f90",
"assets/lib/src/view/screens/home/tabs/indicators/slider_discrete.dart": "45e7ca38ae4eb969c4caa7d549563515",
"assets/lib/src/view/screens/home/tabs/indicators/slider_continuous.dart": "5ed2587cf33ac3a87d68566659389c87",
"assets/lib/src/view/screens/home/tabs/indicators/progress_bar_indicator.dart": "d336fabab0b241caadb120d3c2e4e702",
"assets/lib/src/view/screens/home/tabs/indicators/circular_progress_indicator.dart": "a9173d74d094cc0bc9c07194290144d1",
"assets/assets/images/banner.png": "32d85518fc8ec0a77c3a61bd9fc18a7c",
"assets/fonts/MaterialIcons-Regular.otf": "bbfec2ee884c07e485bd81d9ad2835f1",
"assets/NOTICES": "7d7efa5ef3fe78f40c9a1c84a5e525e5",
"assets/packages/fluent_ui/assets/AcrylicNoise.png": "81f27726c45346351eca125bd062e9a7",
"assets/packages/fluent_ui/fonts/FluentIcons.ttf": "f3c4f09a37ace3246250ff7142da5cdd",
"assets/packages/fluent_ui/fonts/SegoeIcons.ttf": "5c053a34db297a1a533e62815a9b8827",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "613b33b7c5a43b9deb8b6b6ba53df1f9",
"assets/packages/window_manager/images/ic_chrome_maximize.png": "af7499d7657c8b69d23b85156b60298c",
"assets/packages/window_manager/images/ic_chrome_unmaximize.png": "4a90c1909cb74e8f0d35794e2f61d8bf",
"assets/packages/window_manager/images/ic_chrome_close.png": "75f4b8ab3608a05461a31fc18d6b47c2",
"assets/packages/window_manager/images/ic_chrome_minimize.png": "4282cd84cb36edf2efb950ad9269ca62",
"assets/packages/fluentui_system_icons/fonts/FluentSystemIcons-Filled.ttf": "96fc0d384dd4ffa2b4f31de1b03bc1dc",
"assets/packages/fluentui_system_icons/fonts/FluentSystemIcons-Regular.ttf": "3fb49fcc0fd2e66ca5f04aa148dcd125",
"assets/FontManifest.json": "81f3b18294353f57fac93e2a8d6c31d8",
"assets/AssetManifest.bin": "767b2cc7e210d3c7530becc6f42b1245",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "c2e69a0baa9bce864df2b3bfb2bd8d51",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"main.dart.js": "e1cb1f652c19c90f7c244c8e677b3a90"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
