class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :trade
end
