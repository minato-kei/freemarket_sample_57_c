# README

## big_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many   :middle_categories

## middle_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|big_categories_id|integer|null: false,foreign_key: true|

### Association
- belongs_to :big_category
- has_many   :small_categories

## small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|middle_categories_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :middle_category
- has_many :brands_small_categories
- has_many :brands through: :brands_small_categories

## brans_small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|small_categories_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :small_category
- belongs_to :brand

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|small_categories_id|integer|null: false, foreign_key: true|

### Association
- has_many :brands_small_categories
- has_many :small_categories through: :brands_small_categories


## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|year|integer|null: false|
|date|integer|null: false|
|code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|status|integer|null: false, foreign_key: true|
|offer|integer|         |
|acception|boolean|              |
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## shippingsテーブル

|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: true|
|phone|integer|null: true|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|default|boolean|null: false, default: false|

###note
default： trueがdefault出品元。


### Association
- belongs_to :user
- belongs_to :item


## followsテーブル

|Column|Type|Options|
|------|----|-------|
|following_user_id|integer|null: false, foreign_key: true|
|followed_user_id|integer|null: false, foreign_key: true|
|block|boolean|null: false, default: false|


### Association
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item

## searchesテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|status|boolean|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|name                 |string   |index: true,null:false               |商品名
|price                |integer  |null:false                           |価格
|user_id              |integer  |null:false,foreign_key: true         |ユーザーid
|big_category_id      |integer  |null:false,foreign_key: true         |大カテゴリ
|middle_category_id   |integer  |null:false,foreign_key: true         |中カテゴリ
|small_category_id    |integer  |null:false,foreign_key: true         |小カテゴリ
|size                 |string   |                                     |サイズ→必須だけど、服以外では必要ないカラム
|condition            |string   |null:false                           |
|cost_burden          |string   |null:false, default:current_user.id  |送料負担はデフォで出品者負担を選択
|shipping_from        |string   |null:false,                          |
|shipping_day         |string   |null:false                           |発送するまでの日数
|shipping_id          |integer  |null:false,foreign_key: true         |発送元カラムのid
|rating               |string   |null:false                           |出品者評価
|status               |string   |null:false                           |販売状況
### Association
- has_many    :pictures
- belongs_to  :shipping
- belongs_to  :user
- belongs_to  :big_category
- belongs_to  :middle_category
- belongs_to  :small_category
- has_many    :orders
- has_many    :likes

## picturesテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|item_id              |integer  |foreign_key: true                    |
|image_url            |string   |null:false                           |
### Association
- belongs_to :item
## usersテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|nickname             |string   |index: true,null:false               |
|email                |string   |null:false                           |
|password             |string   |null:false                           |
|password_confirmation|string   |null:false                           |
|last_name_kanji      |string   |null:false                           |全角　名漢字
|first_name_kanji     |string   |null:false                           |全角　姓漢字
|last_name_kana       |string   |null:false                           |全角　名カナ
|first_name_kana      |string   |null:false                           |全角　姓カナ
|birthday             |integer  |null:false                           |生年月日
|phone_number         |integer  |null:false                           |
|balance              |integer  |null:false, default: 0               |ポイント残高、デフォは0
|sex                  |string   |                                     |性別は後から選択
### Association
- has_many :shippings
- has_many :orders
- has_many :items
- has_many :credits
- has_many :likes
- has_many :searches

## ordersテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|item_id              |integer  |foreign_key: true                    |
|purchase_user_id     |integer  |null:false,foreign_key: true         |購入者のユーザーid
|deal_at              |datetime |                                     |取引完了日時
|cancel               |string   |                                     |キャンセル事由
|item_status          |string   |null:false, default: for_sale        |デフォは販売中に設定、itemのstatusカラムに関連
購入日時はcreated_atがその役割を果たすので削除
### Association
- belongs_to :item
- belongs_to :user