# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name                 "Antonio Chavez"
    image                "http://graph.facebook.com/926041804076116/picture"
    email                "cavjzz@gmail.com"
    password             "supersecret"
    provider             "facebook"
    uid                  "926041804076116"
    access_token         "CAAVAaohiQCsBAPslz1wJ28G9ZAr0oZAwnOVXWQUdVLRi3Xiue7FgrVa0xiGAeAHGEbWqyV8iGYDZAGR62J6Eg1dsRAi86MDX72Q4NZAb0RAebp7I6ZAPshqIyZC62kIJ8Jaff3Y0tdbxJkDuLZBl5J1poHv7PgZCnztOFdcdanfLRPgT4mErotLBmF0ELMGIRmVQ6iYLjhG0Yqcl9AHe4WMT"
    access_token_expires 1416497808
  end
end

