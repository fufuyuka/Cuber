# Cuber

## サイト概要
### サイトテーマ
立体パズルについて自由に投稿し、交流や情報収集ができるコミュニティサイト

![What_is_Cuber](https://user-images.githubusercontent.com/121597200/227776873-74909341-f6f6-4644-ade4-ee5b2e44761d.png)

### テーマを選んだ理由
もともと立体パズルの1つであるスピードキューブが趣味で、解いたりコレクションしたりしています。
しかし、立体パズルに特化した交流サイトは少ない(ない？)ため、有名なSNSで投稿を探して交流するか、
協会や大学のサークルなどが運営する会に参加するなどしないと立体パズルの話はなかなかできません。
そこで、インターネット上で誰もが気軽に交流できるよう、立体パズルに特化したコミュニティを作ろうと思いました。  
また、立体パズルのブームは日本でもこれまでに3度あり、根強い人気があります。
2度目のブームの背景には、脳トレブームの影響や日本人の世界大会優勝がありました。
パズルには脳トレの側面があり、プレイする上で言語の壁も小さいため、老若男女や国籍を問わず楽しむことができます。
電気も必要ないので環境に優しいSDGsな遊びでもあります。
コミュニティサイトがあることで、立体パズルの普及や楽しさの共有に繋げたいと思い、このテーマを選びました。


### ターゲットユーザー
- 立体パズルに興味がある人や、始めてみたい人
- 立体パズルの解き方に困っている人
- 立体パズルが好きな人


### 主な利用シーン
- 立体パズルの話がしたい時
- 解き方を誰かに質問したい時
- 新しいパズルを買うのに情報収集をしたい時


### 機能紹介
- ユーザーの総いいね数
> ユーザーが投稿した状態(＝削除されていない)にある全ての投稿につけられているいいねの総計。
> 投稿をするほどいいねを貰えるチャンスが増えるため、投稿を促し交流を活発にさせることを目的とする。
![total-favorite](https://user-images.githubusercontent.com/121597200/228825352-52ab308e-ffac-4b95-8f87-fda2c367f63c.png)

- ゲストユーザーの投稿などのリセット機能
> ゲストユーザーとして設置しているアカウントが一つであるため、バッチ処理により投稿やいいねなどを一定時間(1時間おき)にリセットしている。
> 管理者側の管理の負担軽減と、ゲストユーザー側での「前にゲストユーザーを使用した方の履歴がある不自然さ」の軽減を目的とする。
> また、ゲストユーザーを利用した、いいね稼ぎなどの対策としても有用と考える。

## 設計書

<details><summary>ER図</summary>

![Cuber_ER図](https://user-images.githubusercontent.com/121597200/231178958-b6a844ab-4d43-4767-96d1-6a02955dbbef.png)
[Diagrams.net](https://drive.google.com/file/d/1z-BwdRe7vRc_pM9dsblqKiSAT31nMtwn/view?usp=sharing)  
</details>

<details><summary>アプリケーション詳細設計書</summary>

![アプリケーション詳細設計書](https://user-images.githubusercontent.com/121597200/227995589-c2e28edd-b803-4a92-a77b-c5b12c5c6685.png)
</details>

<details><summary>UIflows</summary>

![uiflows_user](https://user-images.githubusercontent.com/121597200/228144953-7a403578-0069-4eff-9dbc-d6d1425ce4aa.jpg)
![uiflows_admin](https://user-images.githubusercontent.com/121597200/228145033-cc76a45f-807d-4894-8435-2d41a674c38c.jpg)
[Diagrams.net](https://drive.google.com/file/d/113n_84lYIh_bFxHnJQaerfQDA98ju6s5/view?usp=sharing)  
</details>


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9


## 使用素材
テストユーザーのアイコンに使用　
[photoAC](https://www.photo-ac.com/)
