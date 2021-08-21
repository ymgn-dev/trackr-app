#!/bin/bash
cd `dirname $0`

flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml

# storyboardのコピー
storyboard_file="../ios/Runner/Base.lproj/LaunchScreen.storyboard"
target_files="../ios/Runner/*LaunchScreen.storyboard"

for filepath in $target_files
do
    cp -rf $storyboard_file $filepath
done

# LaunchImageのコピー
launchimage_path="../ios/Runner/Assets.xcassets/LaunchImage.imageset"
target_launchimages="../ios/Runner/Assets.xcassets/?*LaunchImage.imageset"

for filepath in $target_launchimages
do
    rm -rf ${filepath}/*
    cp ${launchimage_path}/* ${filepath}/
done