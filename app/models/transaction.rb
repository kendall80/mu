class Transaction < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates :category, presence: true
	validates :amount, presence: true
end
