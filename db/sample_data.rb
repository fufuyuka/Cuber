users = User.create!(
  [
    {email: 'guest@example.com', name: 'ゲストユーザー', password: SecureRandom.urlsafe_base64, profiles: "Welcome to Cuber！ このアカウントはゲストアカウントです。投稿したり、いいねしたり、自由にCuberをご体験ください。ご利用後はログアウトをお願いいたします。　それでは、いいね数の下の【新着投稿】から最新の投稿を確認してみてください！" },
    {email: 'sasaki@test.com', name: 'sasaki', password: 'sasakisan', profiles: "はじめまして！", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'hako@test.com', name: 'hako@ロゴデザイナー', password: 'hakosan', profiles: "ロゴデザイナーをしています。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
    {email: 'sushi@test.com', name: '寿司', password: 'sushisan', profiles: "正直、立体パズルより寿司の方が好きかもしれない。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
    {email: 'shiro@test.com', name: 'シマエナガ', password: 'shimaenaga', profiles: "はじめまして、シマエナガです。立体パズルは初心者です。よろしくお願いします〇", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'iroenpitu@test.com', name: '六面体', password: 'iroenpitu', profiles: "ルービックキューブは結構やってます。最近はGANCUBEにハマってます。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'james@test.com', name: 'ジェームズ', password: 'jamessan', profiles: "yoroshiku onegai shimasu!", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.png"), filename:"sample-user6.png")},
    {email: 'kinniku@test.com', name: '中山', password: 'kinniku', profiles: "よろしくおねがいします。筋肉。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email: 'thiyoko@test.com', name: '千世子', password: 'chiyoko', profiles: "可愛いパズル集めてます。色がきれいなのが好きです。揃えるのは得意じゃないので覚え中です。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.png"), filename:"sample-user8.png")},
    {email: 'hirame@test.com', name: 'hirame', password: 'hiramesan', profiles: "ツクダ式はマスターしました。LBL法勉強中ですが、OLL苦戦中；；", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.png"), filename:"sample-user9.png")},
    {email: 'uchida@test.com', name: '内田', password: 'uchidasan', profiles: "内田です、どうも。", profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")}
  ]
)

puzzle_categories = PuzzleCategory.create!(
  [
    {category: '3x3x3'},
    {category: '解き方'},
    {category: '日常'},
    {category: '世界大会'},
    {category: '4x4x4'},
    {category: 'アベレージ'},
    {category: 'GAN13 MafLev-fv'},
    {category: 'その他'},
  ]
)

posts = Post.create!(
  [
    {statement: '初めまして！', user_id: users[1].id },

    {statement: 'よろしくお願いします。', user_id: users[3].id },
    {statement: '登録してみました！', user_id: users[4].id },
    {statement: '六面体です、よろしく', user_id: users[5].id, puzzle_category_id: puzzle_categories[2].id },
    {statement: '3x3x3で今流行りってどこのですか？', user_id: users[9].id, puzzle_category_id: puzzle_categories[0].id },
    {statement: 'hello~!!!', user_id: users[6].id },

    {statement: 'ちよだよ～～、よろしくねっ！', user_id: users[8].id },
    {statement: '世界大会観た方いませんか？語りたいです。', user_id: users[1].id, puzzle_category_id: puzzle_categories[3].id },
    {statement: 'はじめまして！よろしくお願いします～', user_id: users[2].id },
    {statement: '速く回そうとするとすぐポップするんですが、なぜでしょうか？', user_id: users[7].id, puzzle_category_id: puzzle_categories[7].id },
    {statement: '内田です、どうも。', user_id: users[10].id },

    {statement: 'いくら丼美味しすぎない？？', user_id: users[3].id },
    {statement: 'きょう前髪巻くの失敗した、、、', user_id: users[8].id },
    {statement: '明日から３連休だから立体パズルやりたい放題だ、ありがとう祝日！', user_id: users[9].id },
    {statement: '3x3x3のサイズって普通どのくらいですか？', user_id: users[4].id, puzzle_category_id: puzzle_categories[0].id },
    {statement: '今日は解体してメンテするぞ！', user_id: users[1].id },

    {statement: '皆さんのアベレージタイム教えてください！', user_id: users[7].id, puzzle_category_id: puzzle_categories[5].id },
    {statement: 'のど乾いたな', user_id: users[3].id },
    {statement: 'ちょっとリベンジに挑戦してみます', user_id: users[9].id, puzzle_category_id: puzzle_categories[4].id },
    {statement: 'GAN13 MafLev-fvが気になってるんですけど、誰か使用感聞かせてくれませんか？', user_id: users[5].id, puzzle_category_id: puzzle_categories[6].id },
    {statement: 'I bought a new puzzle~~!', user_id: users[6].id, puzzle_category_id: puzzle_categories[2].id },

    {statement: 'PLLのFw R U R’ U’ Fw’ U’ F R U R’ U’ F’ってちょっと苦手かもしれないです。', user_id: users[9].id },
    {statement: 'やっぱり素体は白がかわいいかなぁ？どう思う？', user_id: users[8].id },
    {statement: 'デザイナーのhakoです！このサイトのロゴを作らせていただきました。せっかくなので僕も立体パズルを解けるようになりたいなと思って頑張ってます！', user_id: users[2].id, puzzle_category_id: puzzle_categories[7].id },
    {statement: 'おすすめの解き方教えてください', user_id: users[10].id, puzzle_category_id: puzzle_categories[1].id },
    {statement: 'ブックマークって押したの見えないですか？', user_id: users[5].id, puzzle_category_id: puzzle_categories[1].id }
  ]
)

PostComment.create!(
  [
    {comment: '何の流行りですか？', post_id: posts[4].id, user_id: users[5].id },
    {comment: 'まだ観てないので今度観ます！', post_id: posts[7].id, user_id: users[2].id },
    {comment: 'あ、メーカーのことです！', post_id: posts[4].id, user_id: users[9].id },
    {comment: '無理に回そうとしてませんか？', post_id: posts[9].id, user_id: users[1].id },
    {comment: '57㎜だったと思います', post_id: posts[14].id, user_id: users[10].id },
    {comment: '回転させたときというより、握ったときにとれる感じです。', post_id: posts[9].id, user_id: users[7].id },
    {comment: '握力が強すぎるんじゃないですかね…筋肉が…', post_id: posts[9].id, user_id: users[4].id },
    {comment: 'そうなんですね！ありがとうございます！', post_id: posts[14].id, user_id: users[4].id },
    {comment: "３分くらいです(*'▽')", post_id: posts[16].id, user_id: users[3].id },
    {comment: 'nice~~!', post_id: posts[20].id, user_id: users[6].id },
    {comment: 'ao5が30秒です', post_id: posts[16].id, user_id: users[5].id },
    {comment: '頑張ってください！3x3の状態にして解くと分かりやすいですよ', post_id: posts[18].id, user_id: users[1].id },
    {comment: 'オートアライニングの範囲が広くなったのでじわっとアシストしてくれます。自分はUVとの違いがあまり分からなかったです。', post_id: posts[19].id, user_id: users[9].id },
    {comment: 'UVと変わらないのでしたら、fv買うのはもったいない気がしてきました。情報ありがとうございます。', post_id: posts[19].id, user_id: users[5].id },
    {comment: 'あくまで自分の主観なので参考程度に！', post_id: posts[19].id, user_id: users[9].id },
    {comment: 'その記号ってなんですか？', post_id: posts[21].id, user_id: users[7].id },
    {comment: '回転記号ですよ！', post_id: posts[21].id, user_id: users[1].id },
    {comment: '最初慣れるのは難しいかもしれないですが、文字だけで回転の方法伝えられるので便利ですよ～', post_id: posts[21].id, user_id: users[9].id },
    {comment: 'そんなのがあるんですね！はじめてしりました', post_id: posts[21].id, user_id: users[7].id },
    {comment: 'エナガは白がかわいいと思う', post_id: posts[22].id, user_id: users[4].id },
    {comment: 'だよねぇ～', post_id: posts[22].id, user_id: users[8].id },
    {comment: 'ロゴ作成ありがとうございます！', post_id: posts[23].id, user_id: users[1].id },
    {comment: 'こちらこそ、ご依頼ありがとうございました！', post_id: posts[23].id, user_id: users[2].id },
    {comment: 'hakoさんのデザインだったんですね！', post_id: posts[23].id, user_id: users[3].id },
    {comment: 'いい感じだと思います', post_id: posts[23].id, user_id: users[10].id },
    {comment: 'very good :)', post_id: posts[23].id, user_id: users[6].id },
    {comment: 'そうですよ！いいねと違って、ブックマークは自分だけが確認できます！', post_id: posts[25].id, user_id: users[1].id },
    {comment: '私、お気に入りの投稿をブックマークして一覧にしてるよ', post_id: posts[25].id, user_id: users[8].id }
  ]
)

Favorite.create!(
  [
    {post_id: posts[1].id, user_id: users[2].id },
    {post_id: posts[2].id, user_id: users[6].id },
    {post_id: posts[6].id, user_id: users[2].id },
    {post_id: posts[11].id, user_id: users[7].id },
    {post_id: posts[6].id, user_id: users[4].id },
    {post_id: posts[15].id, user_id: users[9].id },
    {post_id: posts[3].id, user_id: users[9].id },
    {post_id: posts[15].id, user_id: users[10].id },
    {post_id: posts[16].id, user_id: users[9].id },
    {post_id: posts[6].id, user_id: users[10].id },
    {post_id: posts[16].id, user_id: users[10].id },
    {post_id: posts[15].id, user_id: users[4].id },
    {post_id: posts[16].id, user_id: users[5].id },
    {post_id: posts[15].id, user_id: users[7].id },
    {post_id: posts[13].id, user_id: users[5].id },
    {post_id: posts[9].id, user_id: users[4].id },
    {post_id: posts[16].id, user_id: users[6].id },
    {post_id: posts[16].id, user_id: users[1].id },
    {post_id: posts[25].id, user_id: users[8].id },
    {post_id: posts[10].id, user_id: users[1].id },
    {post_id: posts[9].id, user_id: users[9].id },
    {post_id: posts[25].id, user_id: users[6].id },
    {post_id: posts[16].id, user_id: users[7].id },
    {post_id: posts[23].id, user_id: users[6].id },
    {post_id: posts[11].id, user_id: users[5].id },
    {post_id: posts[25].id, user_id: users[3].id },
    {post_id: posts[25].id, user_id: users[1].id },
    {post_id: posts[23].id, user_id: users[5].id },
    {post_id: posts[16].id, user_id: users[8].id },
    {post_id: posts[25].id, user_id: users[9].id },
    {post_id: posts[12].id, user_id: users[2].id },
    {post_id: posts[20].id, user_id: users[7].id },
    {post_id: posts[23].id, user_id: users[1].id },
    {post_id: posts[20].id, user_id: users[3].id },
    {post_id: posts[23].id, user_id: users[3].id },
    {post_id: posts[23].id, user_id: users[4].id },
    {post_id: posts[23].id, user_id: users[7].id },
    {post_id: posts[22].id, user_id: users[4].id },
    {post_id: posts[18].id, user_id: users[1].id },
    {post_id: posts[23].id, user_id: users[8].id },
    {post_id: posts[23].id, user_id: users[10].id },
    {post_id: posts[21].id, user_id: users[10].id },
    {post_id: posts[24].id, user_id: users[3].id },
    {post_id: posts[25].id, user_id: users[10].id },
    {post_id: posts[23].id, user_id: users[9].id }
  ]
)

Bookmark.create!(
  [
    {post_id: posts[19].id, user_id: users[1].id },
    {post_id: posts[22].id, user_id: users[1].id },
    {post_id: posts[7].id, user_id: users[2].id },
    {post_id: posts[2].id, user_id: users[8].id },
    {post_id: posts[0].id, user_id: users[10].id },
    {post_id: posts[23].id, user_id: users[1].id },
    {post_id: posts[23].id, user_id: users[8].id },
    {post_id: posts[25].id, user_id: users[2].id },
    {post_id: posts[6].id, user_id: users[10].id },
    {post_id: posts[25].id, user_id: users[10].id }
  ]
)

Contact.create!(
  [
    {name: 'サンプルお問い合わせ', email: 'sample@test.com', contact_detail: '(ここにお問い合わせの内容が表示されます)', memo: '（お問い合わせの状況ややり取りのメモを書くなどに使用する）' }
  ]
)
