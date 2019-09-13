##App Name
Mercari copy site

## Overview
This app is copy of the mercari(https://www.mercari.com/jp/)  website to improve our coding skill.

## Requirement
ruby 2.5.1
rails 5.2.3

## Usage
```
$ git pull https://github.com/minato-kei/freemarket_sample_57_c.git
$ cd freemarket_sample_57_c
```

## Author
[minato-kei](https://github.com/minato-kei)
[naru-taka](https://github.com/naru-taka)
[kalugo](https://github.com/kalugo)
[fumitrial8](https://github.com/fumitrial8)

## Description
### Create new user
User can sign up by facebook authentication, Google authentication and email registration.
<img src="/sign_up.png" alt="sign_up" title="sign_up">

After user's information registrated, user must fill out SMS authentication, address form and credit card form.
<img src="/google_authentication.png" alt="google_authentication" title="google_authentication">
<img src="/sign_up1.png" alt="sign_up1" title="sign_up1">
<img src="/SMS_confirmation.png" alt="SMS_confirmation" title="SMS_confirmation">
<img src="/sign_up2.png" alt="sign_up2" title="sign_up2">
<img src="/card.png" alt="card" title="card">

### Create new items
After you are signed in, you can create item. In the new#item view, you must fill out follows content - name, explanation, pictures(max: 10), category, size, shipping_date, price.

### Edit items
You can edit your items through your account page.

### Destroy items
You can destroy your items through your account page.

### Purchase items
If you have enough money, you can buy other user's items.
After you are signed in, your account balance is 0 !!!
So if you want to purchase test, you have to log in below account.
email: example1@example.com
password: 00000000

### Search items
You can search items by entering search box or category.

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string|     |

### Association
- has_many   :items

## usersテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|nickname             |string   |index: true,null:false               |
|email                |string   |null:false, null: false                    |
|password             |string   |null:false                           |
|password_confirmation|string   |null:false                           |
|last_name_kanji      |string   |null:false                           |
|first_name_kanji     |string   |null:false                           |
|last_name_kana       |string   |null:false                           |
|first_name_kana      |string   |null:false                           |
|birthday             |integer  |null:false                           |
|phone_number         |integer  |null:false                           |
|balance              |integer  |null:false, default: 0               |
|sex                  |string   |                                     |
### Association
- has_many :shippings, dependent: destroy
- has_many :orders
- has_many :items, dependent: destroy
- has_many :credits, dependent: destroy

## itemsテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|name                 |string   |index: true,null:false               |
|price                |integer  |null:false                           |
|user_id              |integer  |null:false,foreign_key: true         |
|category_id          |integer  |null:false,foreign_key: true         |
|size_id                 |integer   |                                     |
|condition_id            |integer   |null:false                           |
|cost_burden_id         |integer  |null:false                           |
|shipping_from        |integer   |null:false,                          |
|shipping_day_id         |integer   |null:false                           |
|shipping_id          |integer  |null:false,foreign_key: true         |
|rating               |integer  |                                     |
|status_id               |id   |null:false, default: 1         |
### Association

- belongs_to  :shipping
- belongs_to  :user
- belongs_to  :category
- has_many    :pictures, dependent: destroy
- has_many    :orders, dependent: destroy

## creditsテーブル

|Column|Type|Options|
|------|----|-------|
|token|string||
|user_id|integer||

### Association
- belongs_to :user

## shippingsテーブル

|Column|Type|Options|
|------|----|-------|
|zipcode|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: true|
|phone|integer|null: true|
|user_id|integer|null: false, foreign_key: true|
|default|boolean|null: false, default: false|

###note
default： trueがdefault出品元。


### Association
- belongs_to :user
- belongs_to :item

## picturesテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|item_id              |integer  |foreign_key: true                    |
|image            |string   |null:false                           |
### Association
- belongs_to :item


## ordersテーブル
|Column               |Type     |Options                              |
|---------------------|---------|-------------------------------------|
|item_id              |integer  |foreign_key: true                    |
|purchase_user_id     |integer  |null:false,foreign_key: true         |
|deal_at              |datetime |                                     |
|cancel               |string   |                                     |
|item_status          |string   |null:false, default: for_sale        |

### Association
- belongs_to :item
- belongs_to :user