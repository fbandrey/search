#!/bin/bash
mkdir -p ./public/assets/vendor/fonts
# --- FontAwesome
cp node_modules/font-awesome/fonts/* ./public/assets/vendor/fonts/

# --- Lightgallery
cp node_modules/lightgallery.js/dist/fonts/* ./public/assets/vendor/fonts/
cp node_modules/lightgallery.js/dist/img/loading.gif ./public/assets/vendor/
