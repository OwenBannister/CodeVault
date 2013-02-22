module NotificationsHelper

# Check if notification is new
  def check_for_single_notification(notification)
  if notification.last_viewed == nil then 
    return true
  else 
    return false
  end
end

# Get all notifications for user unless admin which sees all notifications
def get_notifications
 Notification.all.select{|n| n.recipient == current_user }
end

def get_paginated_notifications 
 Notification.where(:recipient_id => current_user.id).paginate(:page => params[:navbar], :per_page => 10, :order => 'created_at DESC')
  end


# Set the last_viewed of All notifications to the current time if they were nil and return true if they were
  def update_all_notification_last_viewed
   get_notifications.each do |notification|
      notification.update_attributes(:last_viewed => Time.now)
      notification.save
  end
 
  end


#Check if there are any new notifications to display
 def check_for_any_notifications
  if get_notifications.select {|n| n.last_viewed == nil}.count > 0 then
    return false
  else 
    return true
  end
 end


 


end
