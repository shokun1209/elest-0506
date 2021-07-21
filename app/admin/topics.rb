ActiveAdmin.register Topic do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :text, :category_id, :images, :user_id, :anonymous
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text, :category_id, :images, :user_id, :anonymous]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :text, :anonymous, :images, :category_id
end
