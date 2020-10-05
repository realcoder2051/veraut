class Plan < ApplicationRecord
	validates :question1,:question2,:question3,:question4,:question5, :question6, :question7, :question8, :question9, :question10, :question11,:question12, presence: true
end
