![text_logo](https://user-images.githubusercontent.com/35668159/130312182-c8c7ebc3-f06b-47d4-8424-37e17e1dcba2.png)

# Grinder
## Grinderのインストール
```shell
pub global activate grinder
```

## build_runnerの実行
```shell
grind
```

## アプリ起動
### debug-dev
```shell
flutter run --debug --flavor dev --dart-define=FLAVOR=dev -t lib/main-dev.dart
```

### release-prod
```shell
flutter run --release --flavor prod --dart-define=FLAVOR=prod -t lib/main-prod.dart
```

# Flavor生成
```shell
./flavorizr/flavorizr.sh
```

# スプラッシュ画像の生成
```shell
./native_splash/native_splash.sh
```

# アプリアイコンの生成
```shell
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-dev.yaml
```

# リリース
## キーストアの生成
生成時に指定したパスワードはどこかにメモしておくこと。
```shell
cd android/
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

## Android署名情報を追記
`android/key.properties`を以下のような内容で作成する。
パスワードやエイリアス、ファイル名は適切なものに変更する。
```shell
storePassword=password
keyPassword=password
keyAlias=key
storeFile=key.jks
```

# CI/CD
`GitHub Actions`を導入しています。
mainブランチへのpushで.aabの生成とGoogle Play Consoleへの自動アップロードが行われます。
