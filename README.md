# README

## 開発環境の動作環境
* Docker version 20
* Windows 11 Home

## Dockerイメージのビルド
```
docker-compose build
```
## javascriptパッケージをインストール
```
docker-compose run web yarn install
```
## gemをインストール
```
docker-compose run web bundle install
```
## DB作成
```
docker-compose run web rake db:create
```
## コンテナ群の起動
```
docker-compose up
```
## マイグレーション実行
```
docker-compose run web rails db:migrate
```
## seed実行
```
docker-compose run web rails db:seed
```

localhost:3000にアクセス