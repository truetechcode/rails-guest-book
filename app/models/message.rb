class Message < ApplicationRecord
  include DefaultOrder
  validates :name, :entry, :ip_address, presence: true
  scope :by_ip_address, ->(ip) { where(ip_address: ip) }

  # belongs_to :user, class_name: "user", foreign_key: "user_id"
end
