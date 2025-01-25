'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1abef4033cbe137bd5a8917f011285b3",
"assets/AssetManifest.bin.json": "d3c72574cda486fa1b48534db1b7142d",
"assets/AssetManifest.json": "e9399d3543aac6b55e1a042ce4caaa4e",
"assets/assets/files/Product.json": "313a73b47620808270b11ab1c208d523",
"assets/assets/files/product_data.json": "ec3ecf550a99aa726826c2eacc2d0da0",
"assets/assets/images/10pic.jpg": "92ce192b8d127d60142ea1b03018ff72",
"assets/assets/images/11pic.jpeg": "aedc8ca480dbd7d0969a3f5c2fd2a733",
"assets/assets/images/12pic.jpg": "6621c445c36f132d4051e20245adf8dd",
"assets/assets/images/13pic.jpg": "b2cf4366dbebfd44956c9660e6c76766",
"assets/assets/images/14pic.jpg": "6ffcc44115e945350b77922fe1622870",
"assets/assets/images/15pic.jpg": "9c90d898d9de8fba7069f4d62759009d",
"assets/assets/images/16pic.jpg": "8b1f655fde23679347f0b3b1a95138a1",
"assets/assets/images/17pic.jpg": "2a64aeede75786829be818d335c94135",
"assets/assets/images/18pic.jpg": "7a323e66f67ad3d253c2416a2c1a3151",
"assets/assets/images/19pic.jpg": "61cc4b5b169c222e5bfd27710a0bd64a",
"assets/assets/images/1pic.jpg": "5bff4b1fa0b64c8ff20549027cb78a1d",
"assets/assets/images/20pic.jpg": "44f531f4aa4b5c0e27d17bf36a1b92fc",
"assets/assets/images/21pic.jpg": "a1d5066d64d0c39b3aa04a547a095f44",
"assets/assets/images/22pic.jpg": "cffaad12948034cbc6d2c1d8fd701757",
"assets/assets/images/23pic.jpg": "0871335ef3a9830fc226eeb396078353",
"assets/assets/images/24pic.jpg": "cceb0ef1681122915323183ebeb1eadf",
"assets/assets/images/25pic.jpg": "845f556cb91e8c433ec31e439f45a27e",
"assets/assets/images/26pic.jpg": "459bfea9757067742a1493979cb6127a",
"assets/assets/images/27pic.jpg": "44389215e87b8e52ed5caa55b85e1fbb",
"assets/assets/images/28pic.jpg": "ee79dac02dfadfc3d5569eabdc171a04",
"assets/assets/images/29pic.jpg": "9073be9d3e9808003bafbddad6bfd467",
"assets/assets/images/2pic.jpg": "87c82b711f8ac20d54d4ad32c75f46fe",
"assets/assets/images/30pic.jpg": "e0cae1c50f606573ab4df8cab672c7dd",
"assets/assets/images/3pic.jpg": "128aa0f88cc221530c2e825ed78e953c",
"assets/assets/images/4pic.jpg": "6929c60dc3cc011bcdda58b5fdd92d72",
"assets/assets/images/5pic.jpg": "354126aefff4ea129ad18fecf17fc8d6",
"assets/assets/images/6pic.jpg": "2ee7f658dcba66e69e33737ba5ffbb20",
"assets/assets/images/7pic.jpg": "76a3d4a1a80feef8e58021c88496aaa1",
"assets/assets/images/8pic.jpg": "2ece0ea6a0127bc1ec11abf13065a5e9",
"assets/assets/images/9pic.jpg": "30f8e05ad71a82519f88254469c95755",
"assets/assets/images/CampusShirt/CampusShirt1.jpg": "f295c3fbf264d18ee1283300da1014e5",
"assets/assets/images/CampusShirt/CampusShirt2.jpg": "c61287a8d2a75de051c49071cf6bb6ec",
"assets/assets/images/LGTV/LGTV1.jpeg.webp": "a656ef3332df2657c901bcb8f61f98cc",
"assets/assets/images/LGTV/LGTV2.jpeg.webp": "0559ab1cf2f9dd6851bd395c69812e55",
"assets/assets/images/LGTV/LGTV3.jpeg.webp": "75ea2c14935fe53455b5a9bc81b269db",
"assets/assets/images/OnePlus/OnePlus1.jpg": "5bff4b1fa0b64c8ff20549027cb78a1d",
"assets/assets/images/OnePlus/OnePlus2.jpg": "21b558c0eec5b27b391c7dce4675902e",
"assets/assets/images/Samsung/Samsung1.jpg": "94ae8ae2042b2ebd9fd14b17a889a99f",
"assets/assets/images/Samsung/Samsung2.jpg": "c3ff84d207182fc900adc09869279c73",
"assets/assets/images/SamsungTV/SamsungTV1.jpg": "95811caa694f95b9497aebfe0ed552c8",
"assets/assets/images/SamsungTV/SamsungTV2.jpg": "a7cb9dbd07c68202098d7edd6396ca40",
"assets/assets/images/SamsungTV/SamsungTV3.jpg": "828b8b53043e5044c457e2b90016a5ce",
"assets/assets/logo.svg": "390e4867853864cecf6dc3a1df841728",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1f06b2960e2039a8f92a7152260f79ad",
"assets/NOTICES": "85f6e60b499773118fc1970e04821895",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "693a6a19df23c77c5c63ab5834ec5a9f",
"/": "693a6a19df23c77c5c63ab5834ec5a9f",
"main.dart.js": "02c58aaebefff6567b331d7640e766ba",
"manifest.json": "5d7a3e401ed318284b9f5aea991de268",
"version.json": "8d019d5d7e34032e1be2814e3c2c5539"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
