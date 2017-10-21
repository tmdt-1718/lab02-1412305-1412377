class Usermail < ApplicationRecord
  belongs_to :user
  belongs_to :mail
end
