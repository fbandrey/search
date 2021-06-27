FactoryBot.define do
  factory :procedure do
    title { "Procedure-#{Time.now.to_i}" }
  end
end
