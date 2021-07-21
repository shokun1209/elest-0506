ActiveAdmin.register Comment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :topic_id, :type_id, :comment, :anonymous, :images
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :topic_id, :type_id, :comment, :anonymous, :images]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :comment, :anonymous, :images, :type_id
end
