# README

### users table
|Column   |Type  |Option|
|---------|------|------|
|email    |string|null: false|
|password_digest |string|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|email|index|unique: true|
