class Signup < ApplicationRecord
    validates :time, inclusion: (0..23).to_a
    
    belongs_to :activity 
    belongs_to :camper 
end
