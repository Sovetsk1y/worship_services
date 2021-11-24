'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "083d1e0abc841f07ea673948e22a25ce",
"index.html": "b3aa6463f8f949d75ff6767176471ac2",
"/": "b3aa6463f8f949d75ff6767176471ac2",
"main.dart.js": "c06cb8db86ae27762884d82930b65824",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7b6eb781a9ce81a10ab34c91ec8a95e3",
"assets/AssetManifest.json": "1b7eb693d9d5ed19a3d2b5c3b7a38e28",
"assets/NOTICES": "8aa93fe788c6ca18cc280088f0c62b24",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/root_tab_bar/my_schedule/2.0x/my_schedule.png": "8de654e275abd8a976da01a57f804f68",
"assets/assets/root_tab_bar/my_schedule/3.0x/my_schedule.png": "c179eed1a2f9262f13ee87e332fe948c",
"assets/assets/root_tab_bar/my_schedule/my_schedule.png": "99e279c7c7aeaf5be499dc522b578a7f",
"assets/assets/root_tab_bar/song_lib/2.0x/song_lib.png": "ad143db020d415e2d185823f1cabccd4",
"assets/assets/root_tab_bar/song_lib/3.0x/song_lib.png": "89611a283ef7a5f565d6bb8a0b056054",
"assets/assets/root_tab_bar/song_lib/song_lib.png": "b3150c5067e3aa50104446ca6464930a",
"assets/assets/root_tab_bar/my_profile/2.0x/my_profile.png": "f8c0613c252202c23c6ff9f4f05ef855",
"assets/assets/root_tab_bar/my_profile/3.0x/my_profile.png": "6b5c7918f27efa1771a094096108b4c2",
"assets/assets/root_tab_bar/my_profile/my_profile.png": "53bcbd67c3e23009dd04f9010a9eec4e",
"assets/assets/illustrations/avatars_big/man1/2.0x/man1.png": "072c7392ffd0e38be1dfb615cf0ff7f6",
"assets/assets/illustrations/avatars_big/man1/3.0x/man1.png": "03db2630ce8b22de081f9c44a28a8b71",
"assets/assets/illustrations/avatars_big/man1/man1.png": "729008bdfc8cce72a372e9162be0deb6",
"assets/assets/illustrations/empty_list_man/empty_list_man.png": "e76a5296a3c1847e07e408822c11c79b",
"assets/assets/illustrations/empty_list_man/2.0x/empty_list_man.png": "c1a0d3d83c3353cb84b3426fb49eea31",
"assets/assets/illustrations/empty_list_man/3.0x/empty_list_man.png": "47d1f6291e64840c29960ef5cbec19d7",
"assets/google_fonts/Montserrat-ExtraBold.ttf": "19ba7aa52a78c3896558ac1c0a5fb4c7"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
