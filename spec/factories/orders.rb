FactoryBot.define do
  factory :record_address do
    postal_code       { '123-4567' }
    area_id           { 2 }
    city              { '市場' }
    house_number      { '番地' }
    building_name     { '建物' }
    phone_number      { '09012345678' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
