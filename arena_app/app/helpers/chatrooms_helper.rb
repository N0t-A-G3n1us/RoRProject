module ChatroomsHelper
	def parent_check
		if (@chatroom.team.nil? && params[:group_id].present? && @chatroom.group_id.to_s.inspect == params[:group_id].inspect ) 
  			@parent = Group.find(params[:group_id])
  		elsif (@chatroom.group.nil? && params[:team_id].present? && @chatroom.team_id.to_s.inspect == params[:team_id].inspect) 
  			@parent = Team.find(params[:team_id])
  		else 
  			flash[:danger] = 'ERRORE NO TEAM OR GROUP'
  			redirect_to root_url
  		end
	end
end
