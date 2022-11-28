'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "967af3b5ab7dfbb35b2088c515492d3e",
"index.html": "76dde8e163de9e336eb4c55b96ab4abb",
"/": "76dde8e163de9e336eb4c55b96ab4abb",
"main.dart.js": "e2181eaef0d68879e550feb72ae5bf3b",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "25354b6555a749fa4aee6d702c9a32c4",
"assets/AssetManifest.json": "d613bc3632a630551c07e1a0c7cc6773",
"assets/NOTICES": "242b56148b61784c4b61d5f4c6907774",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "7d33cfe27b8d49381fd00d25460348c4",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/kcGitHub.png": "ddeddfb284a93c6b3e89a0944804d97e",
"assets/assets/kcInstagram.png": "8e47de111b9a9b94ce5e9ae2335af17f",
"assets/assets/defaults/overlays/kcOverlayRythm.png": "8329b1a8a312ffa6dbdd6f09dc923890",
"assets/assets/defaults/overlays/kcOverlayQnet.png": "2ac5e239a38491624da0d0364154241b",
"assets/assets/defaults/overlays/kcOverlayQI.png": "6227dfd94fa1175484a3e67943cbfe50",
"assets/assets/defaults/overlays/kcOverlayQIGroup.png": "64cc7fb21b12779880fc70522231f1a3",
"assets/assets/defaults/overlays/kcOverlayTheV.png": "3fa47f7a3a793cf66932ea308f5ef1ff",
"assets/assets/defaults/Icons/kcShare.png": "5113823ddfa516223281979089e2ecd2",
"assets/assets/defaults/Icons/kcPerson.png": "9a2887747354e3e42d639e09cb6b25a6",
"assets/assets/defaults/Icons/kcSettings.png": "cc5129ec42dfe17ae886d13882a4378f",
"assets/assets/defaults/Icons/kcHome.png": "69b36e21508c3e06ce8aa6890fa27a56",
"assets/assets/defaults/Icons/kcCall.png": "fb95ff79342cc93b16e300beca55d687",
"assets/assets/defaults/Icons/kcLocation.png": "c8c8be0896f801acf28609c9d591df66",
"assets/assets/defaults/Icons/kcEmail.png": "97b3da8702eb3b71970f96be721636ca",
"assets/assets/defaults/Icons/kcReorder.png": "abce502467eb61ea96e8f9e54e1eeba4",
"assets/assets/defaults/Icons/kcAddImage.png": "447a4cb1bd83931d54c6fb1f38ec6421",
"assets/assets/defaults/Icons/kcScan.png": "d5ac815872de3df028462122290d3422",
"assets/assets/defaults/Socials/kcTelegram.png": "9bceabeb740b06e79486e2aa12b2e321",
"assets/assets/defaults/Socials/kcGitHub.png": "ddeddfb284a93c6b3e89a0944804d97e",
"assets/assets/defaults/Socials/kcInstagram.png": "8e47de111b9a9b94ce5e9ae2335af17f",
"assets/assets/defaults/Socials/kcTwitter.png": "0463d0459ece96b41c08ddb660771778",
"assets/assets/defaults/Socials/kcLinkedin.png": "a8e9bd719ebe072df9978adc3cec1cd4",
"assets/assets/defaults/Socials/kcYoutube.png": "dc1c322d8e0515c56762bb024a6204e9",
"assets/assets/defaults/Socials/kcWhatsapp.png": "d8cde086df958da88763ea4be32b96be",
"assets/assets/defaults/Socials/kcFacebook.png": "5bbf194f2043d06f1199956075221fe4",
"assets/assets/kDefaultBackdrop.png": "4d11ba091afcdf51eb11dbbb07b387c6",
"assets/assets/kcTwitter.png": "0463d0459ece96b41c08ddb660771778",
"assets/assets/kcCall.png": "fb95ff79342cc93b16e300beca55d687",
"assets/assets/kcLinkedin.png": "a8e9bd719ebe072df9978adc3cec1cd4",
"assets/assets/kcLocation.png": "c8c8be0896f801acf28609c9d591df66",
"assets/assets/kcEmail.png": "97b3da8702eb3b71970f96be721636ca",
"assets/assets/kcOverlay.png": "d96cb62125293f830605c97b7beaf327",
"assets/assets/kcDefault2.png": "17f68aecae644805759bc196c1bd6489",
"assets/assets/kcFacebook.png": "5bbf194f2043d06f1199956075221fe4",
"assets/assets/kcDefault.png": "443ecc1a8f88c86537c00fb6e5b922b4",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
