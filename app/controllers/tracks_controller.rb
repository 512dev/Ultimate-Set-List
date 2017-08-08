class TracksController < ApplicationController
	def index
		@album = params[:album]
		print "Tracks for #{@album}"
		skip_policy_scope

	end
end
