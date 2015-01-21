class Part < ActiveRecord::Base
	
	belongs_to :article

	has_many :contents, as: :content_owner

	scope :tip_parts, lambda{where(:part_type => "tip")} #returns a tip the _part is added to avoid confusion
	scope :warning_parts, lambda{where(:part_type => "warning")} # returns a warning
	scope :source_parts, lambda{where(:part_type => "source")} #returns a source
	scope :method_parts, lambda{where("part_type = 'methods' OR part_type = 'parts'")} # returns a method
	scope :introduction_part, lambda{where(:part_type => "tip")} #returns the introduction
end
