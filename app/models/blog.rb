class Blog < ApplicationRecord
    validates :title, presence: true
    validates :publishing_date, presence: true
    
end
