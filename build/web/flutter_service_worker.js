'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0a81ff12338feb7d8aa7dc8b1fbc4970",
"version.json": "ee186b6c2b52b79ec344c5a9b2760cf1",
"index.html": "64815b4a54fde645ff7034dfdb28c764",
"/": "64815b4a54fde645ff7034dfdb28c764",
"main.dart.js": "5ffe163dece6e24b7fdf9cfe9f3a6187",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/favicon-16x16.png": "5ad1a9a7218647d45ad8125f2667e088",
"icons/favicon.ico": "d45490f353dff3264d58c1da695280d6",
"icons/android-chrome-192x192.png": "e040fbf075dade37a4aada83ec8b3fd2",
"icons/apple-touch-icon.png": "8f9b2029dbe4f6d56a61ca6488b4e9c9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/headphones.ico": "0dfddbabcd66286159551d22a2f32d66",
"icons/android-chrome-512x512.png": "037c5b03687a36a6e00b5bdfc6526916",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/favicon-32x32.png": "eb3484f7d4ec0acc7075e84722b74c75",
"manifest.json": "0fee47da7855eea0653e044f26e72fb2",
"assets/AssetManifest.json": "3905906959172220b2e4fc1ccabc35ca",
"assets/NOTICES": "54325e5409a1e845875346b42b059f18",
"assets/FontManifest.json": "85d68f2d42d42fe3869c9e6c01b908cb",
"assets/AssetManifest.bin.json": "0328e12acb910243d476c69342762793",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "74ef24ee0d7e3d646c463062820e3439",
"assets/fonts/MaterialIcons-Regular.otf": "a270c1128a0cd862d978ed527b6cce4d",
"assets/assets/posts/blog6/cover/cover.jpeg": "0781f15707c53e8a031d0da6b6944bd6",
"assets/assets/posts/blog1/photos/IMG_7621.jpeg": "0bd2a4f1c90482c17d45472b9c645565",
"assets/assets/posts/blog1/photos/IMG_7631.jpeg": "99b0ddd83a3ec0b2888259051c569ba4",
"assets/assets/posts/blog1/photos/IMG_7597.jpeg": "3c0b03d2f5797219084d4e31ffaa919d",
"assets/assets/posts/blog1/photos/IMG_6234.jpeg": "de1643c77c57d8b87f5e084d724f999b",
"assets/assets/posts/blog1/photos/IMG_7530.jpeg": "ec644bc2d59f72640b7d2a9cd7e1b662",
"assets/assets/posts/blog1/photos/Image4.JPG": "6b599a459924d8b5e80add867c29018b",
"assets/assets/posts/blog1/photos/Image1.png": "b43e4bc76f366924c2592e97e8e0fd5e",
"assets/assets/posts/blog1/photos/Image2.png": "62934522dec66b7d024ecfc1ed12908b",
"assets/assets/posts/blog1/photos/Image3.jpeg": "5377ff4fa6e11eb130d37a73e182868d",
"assets/assets/posts/blog1/cover/cover.jpeg": "09c6fc8d447baee4b59e4962331f1d1f",
"assets/assets/posts/blog8/cover/cover.jpeg": "c2f707948e4268a1578c8ca0ae320820",
"assets/assets/posts/blog9/cover/cover.jpeg": "398ab3e0b1de6f717c20b9136a236d95",
"assets/assets/posts/blog7/cover/cover.jpeg": "036225df2d4d149285fdd144785242ae",
"assets/assets/posts/blog2/cover/cover.jpeg": "bc0a2e13520a1bb1ac7a9684eddfa913",
"assets/assets/posts/blog5/cover/cover.jpeg": "65e5bc21dd6276a0087094bd92e4c321",
"assets/assets/posts/blog4/cover/cover.jpeg": "b254e8bfe96b23a2270525e2a6140cb2",
"assets/assets/posts/blog3/cover/cover.jpeg": "1b3c48270bbb5c64868d2a1e853d00b8",
"assets/assets/fonts/Lora-Italic.ttf": "21e7be184313162be8813c73ca093347",
"assets/assets/fonts/Lora.ttf": "5666f85e55c0b9e2be416718b8278445",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
