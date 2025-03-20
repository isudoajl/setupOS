# Firefox Video Playback Fix - Solution Summary

## Problem
Firefox showing `NS_ERROR_DOM_MEDIA_DECODE_ERR` when playing YouTube videos due to codec issues with the free/limited versions of FFmpeg on Fedora 41.

## Solution Steps

### 1. Remove Conflicting Free Versions of FFmpeg
```bash
sudo dnf remove libswscale-free ffmpeg-free -y
```

### 2. Install Complete FFmpeg from RPM Fusion
```bash
sudo dnf install ffmpeg ffmpeg-libs -y
```

### 3. Install Essential GStreamer Plugins
```bash
sudo dnf install gstreamer1-plugin-libav -y
sudo dnf install gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly -y
```

### 4. Clear Firefox Cache
```bash
rm -rf ~/.cache/mozilla/firefox/*/cache2
```

### 5. Restart Firefox
Close Firefox completely and reopen it to use the new codecs.

## Why This Works
- Fedora's default free versions of media codecs are limited due to licensing restrictions
- RPM Fusion provides full-featured codecs that include patented formats needed for web video
- The GStreamer plugins add support for various media formats that YouTube requires
- Clearing the cache forces Firefox to use the newly installed codecs

## For Future Reference
If video playback issues return after system updates, run through these steps again as updates might reinstall the free versions of packages. 
