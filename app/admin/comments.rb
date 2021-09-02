ActiveAdmin.register Comment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :topic_id, :type_id, :comment, :anonymous, :images
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :topic_id, :type_id, :comment, :anonymous, :images]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # permit_params :comment, :anonymous, :images, :type_id

  index do
    selectable_column
    id_column
    column '投稿者' do |comment|
      comment.user.nickname
    end
    column 'トピック名' do |comment|
      comment.topic.title
    end
    column 'コメント' do |comment|
      comment.comment
    end
    column :created_at
    actions
  end

  show do |comment|
    attributes_table do
      row :id
      row "投稿者" do comment.user.nickname end
      row "内容" do comment.comment end
      row "カテゴリー" do comment.type.name end
      row "匿名表示" do comment.anonymous end
      if comment.images.present?
        row "画像" do
          comment.images.each do |image|
            image_tag image.url
          end
        end
      else
        row "画像" do "画像はありません" end
      end
      row :created_at
    end
    active_admin_comments
  end

end
