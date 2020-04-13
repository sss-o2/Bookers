class Book < ApplicationRecord
	validates :tilte, presence: true
	validates :body, presence: true
end
