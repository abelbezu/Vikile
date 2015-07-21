class VersionUtilities

	#takes in a nested (or flat) hash and removes a certain field from the root and every sub hash
	def self.prun_nested_hash prunned_feild, nested_hash
		prunned = Hash.new
		nested_hash.each_key do |v|
			unless prunned_feild == v
				if nested_hash[v].class == Hash
					prunned[v] = VersionUtilities.prun_nested_hash(prunned_feild, nested_hash[v])
				else
					prunned[v] = nested_hash[v]
				end
			end
			
		end
		return prunned
	end

	def self.generate_diff flat_article_parent, flat_article_child
		#diff_info = []
		#flat_article_parent.
		#Diffy::Diff.new(flat_article_parent, flat_article_child).to_s).split("\n")

	end

end


## test cases, please dont delete
# puts VersionUtilities.generate_diff(Article.find(1).generate_flat_version, Article.find(1).generate_flat_version)

# puts  VersionUtilities.generate_diff(Article.find(1).generate_flat_version, Article.find(2).generate_flat_version)

# puts VersionUtilities.prun_nested_hash("id", {id: '1', some: "thing"})
# puts VersionUtilities.prun_nested_hash(:id, {id: '1', some: "thing", id: {id: '1', some: "thing"}, other: {id: '1', some: "thing"}})
# puts VersionUtilities.prun_nested_hash(:id, {id: '1', some: "thing", id: {id: '1', some: "thing"}, other: {id: '1', some: "thing"}, worse: {id: '1', some: "thing", id: {id: '1', some: "thing"}, other: {id: '1', some: "thing"}}})
# puts VersionUtilities.prun_nested_hash("id", {"utf8"=>"✓", "authenticity_token"=>"BOLnr4a44WouqMEGkLzmUPK3SbCuUnkuk9JNNx0VNByOUZuZOv0/A724pz6GU7ih60rpSlw5i5xHyGl4McdfKA==", "article"=>{"id"=>"1", "segment_type"=>"parts", "title"=>"Testing article one", "category"=>"Entertainment", "segments_attributes"=>{"0"=>{"_destroy"=>"false", "position"=>"", "title"=>"This step has a title", "contents_attributes"=>{"0"=>{"position"=>"", "image_attributes"=>{"id"=>"1"}, "content_body"=>"Dont know how the stuff is going to be presented", "_destroy"=>"false", "id"=>"2"}}, "id"=>"1"}, "1"=>{"_destroy"=>"false", "position"=>"", "title"=>"This part is not broken", "contents_attributes"=>{"0"=>{"position"=>"", "content_body"=>"I added this now, no pictures", "_destroy"=>"false", "id"=>"6"}}, "id"=>"2"}}, "tips_attributes"=>{"0"=>{"tip_position"=>"", "contents_attributes"=>{"0"=>{"content_body"=>"I didn't sign any contract", "id"=>"1"}, "1436376490371"=>{"content_body"=>"cant sign anything before the project is completed"}}, "id"=>"1"}}, "warnings_attributes"=>{"0"=>{"warning_position"=>"", "contents_attributes"=>{"0"=>{"content_body"=>"Okay, I did something else here, what do you thing is the result", "id"=>"5"}}, "id"=>"1"}}, "status"=>"draft"}, "commit"=>"Save", "id"=>"1"})