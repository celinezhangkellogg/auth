class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new
    @activity["contact_id"] = params["contact_id"]
    @activity["activity_type"] = params["activity_type"]
    @activity["note"] = params["note"]
    # when you create an activity, it is assigned to whoever logged in
    @activity["user_id"] = session ["user_id"]
    @activity.save
    redirect_to "/contacts/#{@activity["contact_id"]}"
  end

end
