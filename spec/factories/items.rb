FactoryBot.define do
  factory :item do
    
    item_name     {"テスト"}
    details       {"test"}
    category_id   {2}
    status_id     {2}
    shipping_fee_id   {2}
    area_id       {2}
    delivery_date_id  {2}
    price         {500}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/test_gazou/test_gazou01.jpg'), filename: 'test_image.png')
    end

    association :user

  end 
end