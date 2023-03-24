users = User.create!(
  [
    {email: 'guest@example.com', name: 'ゲストユーザー', password: SecureRandom.urlsafe_base64, profiles: "Welcome to Cuber！ このアカウントはゲストアカウントです。投稿したり、いいねしたり、自由にCuberをご体験ください。ご利用後はログアウトをお願いいたします。" },
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

Post.create!(
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
    {statement: 'おすすめの解き方教えてください', user_id: users[10].id, puzzle_category_id: puzzle_categories[1].id }
  ]
)
