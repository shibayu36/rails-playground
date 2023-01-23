# frozen_string_literal: true

FactoryBot.define do
  factory :diary do
    association :user
    sequence(:name) { |n| "diary#{n}" }
  end
end
