# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  # 
  task :populate => :environment do
    require 'faker'

    #Rake::Task['db:reset'].invoke
    Account.create!(
        :first_name => "Famien", #=> "Kaci"
        :last_name => "Koko",
        :email => "fakoko@test.org",
        :display_name => "Fakoko",
        :password => "123456789",
        :privilege => "super")
    # Create test_user account
    # 
    2.times do |a|
      test_user = Account.create!(
        :first_name => Faker::Name.first_name, #=> "Kaci"
        :last_name => Faker::Name.last_name,
        :email => "user_#{a}@test.org",
        :display_name => "test",
        :password => "password",
        :privilege => "user")
      
      # Create admin_user's courses
      # 
      5.times do |art|
        test_article = Article.create!(
          :title => Faker::Lorem.sentence,
          :category => ["Entertainment", "Sports", "Technology", "Health", "Education","Turkish Culture", "Relationships", "Personal", "Business"][Random.rand(9)],
          :segment_type => "parts",
          :status => ["draft", "editable", "published"][Random.rand(3)],

          :account_id => test_user.id)

        # Create entries for admin_user's courses
        # 
        5.times do |seg|
          test_segment = Segment.create!(
            :title => Faker::Lorem.sentence,            
            :article_id => test_article.id)
            

        5.times do |con|
          test_content = Content.create!(
            :content_owner_id => test_segment.id,
            
            :content_owner_type => "Segment",
            :content_body => Faker::Lorem.paragraph(4))
        end
      end
          # 
          test_tip = Tip.create!(
            :article_id => test_article.id)
            
           
          3.times do |test_tip_content|
          test_tip_content = Content.create!(
            :content_owner_id => test_tip.id,
            
            :content_owner_type => "Tip",
            :content_body => Faker::Lorem.paragraph(4))
        end
        # 
          test_warning = Warning.create!(
            :article_id => test_article.id)
            
            
          3.times do |test_warning_content|
          test_warning_content = Content.create!(
            :content_owner_id => test_warning.id,
            
            :content_owner_type => "Warning",
            :content_body => Faker::Lorem.paragraph(4))

          end
          # 
      end
      # 
    end
    # 
    end
# 
end


