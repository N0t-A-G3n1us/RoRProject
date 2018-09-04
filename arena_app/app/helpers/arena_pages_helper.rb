module ArenaPagesHelper

# @stream1=body[res][num_stream][diusplay name]
	def check_video_json(body,num_stream)
		if !body["streams"].nil?
			res=body["streams"][num_stream]
			if ! res.nil?
				return res["channel"]["display_name"]
			else
				return nil
			end
		else
			return nil
		end

	end
end
