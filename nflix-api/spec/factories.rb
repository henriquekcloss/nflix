require_relative "models/user_model.rb"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Henrique" }
    email { "henrique@henrique.com" }
    password { "henrique123" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
    end
  end

  factory :user_wrong_email, class: UserModel do
    full_name { "Henrique" }
    email { "henrique#henrique.com" }
    password { "henrique123" }
  end

  factory :user_duplicated_email, class: UserModel do
    full_name { "Im Duplicated" }
    email { "duplicated@fail.com" }
    password { "dup123" }

    after(:build) do |user|
      Database.new.delete_user(user.email)
      ApiUser.save(user.to_hash)
    end
  end

  factory :empty_user_name, class: UserModel do
    full_name { "" }
    email { "name_empty@empty.com" }
    password { "empty123" }
  end

  factory :empty_user_email, class: UserModel do
    full_name { "Henrique" }
    email { "" }
    password { "empty123" }
  end

  factory :empty_user_password, class: UserModel do
    full_name { "Henrique" }
    email { "password_empty@empty.com" }
    password { "" }
  end

  factory :null_user_name, class: UserModel do
    email { "password_empty@empty.com" }
    password { "" }
  end

  factory :null_user_email, class: UserModel do
    full_name { "Henrique" }
    password { "" }
  end

  factory :null_user_password, class: UserModel do
    full_name { "Henrique" }
    email { "password_empty@empty.com" }
  end
end
