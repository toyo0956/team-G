FactoryBot.define do

  factory :user do
    id                  {"1"}
    sequence(:email)    {Faker::Internet.email}
    nickname            {"abe"}
    family_name         {"abe"}
    first_name          {"aa"}
    family_name_kana    {"あべ"}
    first_name_kana     {"ああ"}
    birthdate_year      {"1999"}
    birthdate_month     {"09"}
    birthdate_day       {"11"}
    encrypted_password  {password}
    password            {"0000000"}
  end
end