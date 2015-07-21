FactoryGirl.define do  factory :advertisement do
    
  end
  factory :relationship do
    
  end
 
	factory :account do
		first_name "john"
		last_name "doe"
		display_name "jdoe"
		email "#{display_name}@example.com"
		password "123456789"

	end
end