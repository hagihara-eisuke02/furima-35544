class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number,
                :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city,
                   house_number: house_number, phone_number: phone_number, record_id: record.id)
  end
end
