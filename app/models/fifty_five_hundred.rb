class FiftyFiveHundred < ApplicationRecord
	validates :question1,:question2,:question3,:question4,:question5, :question6,  presence: true

end
