# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## b_categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many   :m_categories

## category_mテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|b_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :b_category
- has_many   :s_categories

## s_categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|m_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :m_category
- has_many :brands through: :brands_s_categories

## brans_s_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|s_category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :s_category
- belongs_to :brand

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category3_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :s_category
- has_many :categories through: :brands_s_categories


## creditテーブル

|Column|Type|Options|
|------|----|-------|
|num|integer|null: false|
|year|integer|null: false|
|date|integer|null: false|
|s_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## commentテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|status|integer|null: false, foreign_key: true|
|offer|integer|null: false|
|o_flag|boolean|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## shippingテーブル

|Column|Type|Options|
|------|----|-------|
|p_code|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: true|
|phone|integer|null: true|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :product


## followテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|followed_user_id|integer|null: false, foreign_key: true|
|flag|boolean|null: false|


### Association
- belongs_to :user

## niceテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :product

## searchテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|status|boolean|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user