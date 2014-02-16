---
title: フィーチャと一対一なステップ定義(アンチパターン)
date: 2014-02-16 15:30 JST
tags:
---

原文 : [Feature Coupled Step Definitions (Antipattern)](https://github.com/cucumber/cucumber/wiki/Feature-Coupled-Step-Definitions-(Antipattern))

--------------

フィーチャと一対一なステップ定義はフィーチャやシナリオをまたいで使うことのできないステップ定義です。
これは、ステップ定義の急増やコードの重複、そしてメンテナンスが大変になるため有害です。

## 例

架空の履歴書アプリに以下のステップがあります:

```
features/
+--edit_work_experience.feature
+--edit_languages.feature
+--edit_education.feature
+--steps/
   +--edit_work_experience_steps.rb
   +--edit_languages_steps.rb
   +--edit_education_steps.rb
```

`edit_work_experience.feature` に次のようなシナリオがあります:

```gherkin
シナリオ: 説明を追加する
  前提 履歴書があり、説明の編集ページを表示している
  かつ "説明" に "Cucumber BDD tool" と記入する
  もし "保存" を押す
  ならば "説明" に "Cucumber BDD tool" と表示されていること
```

`edit_work_experience_steps.rb` が次のように実装されています:

```ruby
前提 /履歴書があり、説明の編集ページを表示している/ do
  @employee = Employee.create!(:name => 'Sally')
  @employee.create_cv
  visits("/employees/#{@employee.id}/descriptions/new")
end
```

## 修正方法

1. ステップをドメインコンセプト毎にまとめます。[ステップのまとめ方](https://github.com/cucumber/cucumber/wiki/Step-Organisation)を見てください。
2. step.rb ファイルを(フィーチャやシナリオに関連した名前ではなく)ドメインに関連した名前に変更します。
3. [結合したステップ(アンチパターン)](https://github.com/cucumber/cucumber/wiki/Conjunction-Steps-%28Antipattern%29)を独立したステップに分解します。
