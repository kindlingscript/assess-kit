FactoryGirl.define do 
	factory :user do
		sequence :email do |n|
			"emailtest#{n}@gmail.com"
		end
		password "password"
		password_confirmation "password"
	end

	factory :comment do
		message "Cool place."
		rating "4_stars"
		association :user
		association :place
	end

	factory :place do
		name "Denny's Skatepark"
		description "Tons of ramps and slides"
		address "123 Sample Street"
		association :user
	end
end