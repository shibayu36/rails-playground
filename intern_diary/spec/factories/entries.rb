# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    association :diary
    sequence(:title) { |n| "title#{n}" }
    sequence(:body) { |n| "body#{n}" }
  end
end
