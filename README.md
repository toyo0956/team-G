# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthdate_year|string|null: false|
|birthdate_month|string|null: false|
|birthdate_day|string|null: false|
|phone_number|string||

### Association
- has_many : items
- has_many : likes, dependent: :destroy
- has_one : card, dependent: :destroy
- has_many : orders, dependent: :destroy
- has_one : address, dependent: :destroy

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null: false|
|description|text|null: false|
|condition|string|null: false|
|feepayer|string|null: false|
|method|string|null: false|
|region|string|null: false|
|days|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many : likes
- has_many : images
- belongs_to : user
- has_one : order
- belongs_to : brand
- belongs_to : category

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
|postal_code|string|null: false|
|prefacture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|

### Association
- belongs_to : user

## orderテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|buyer_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|status|string||

### Association
- belongs_to : buyer, class name 'User'
- belongs_to : item

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : item

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null: false|
|ancestry|string||

### Association
- has_many : items

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to : item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null: false|

### Association
- has_many : items

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
|card_number|string|null: false|
|expiration_month|string|null: false|
|expiration_year|string|null: false|
|security_cord|string|null: false|

### Association
- belongs_to : user
