class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :experiment, :counter_cache => true
end

