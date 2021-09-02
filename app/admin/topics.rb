ActiveAdmin.register Topic do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :text, :category_id, :images, :user_id, :anonymous
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :text, :category_id, :images, :user_id, :anonymous]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # permit_params :title, :text, :anonymous, :images, :category_id

  index do
    selectable_column
    id_column
    column '投稿者' do |topic|
      topic.user.nickname
    end
    column 'タイトル' do |topic|
      topic.title
    end
    column '内容' do |topic|
      topic.text
    end
    column '匿名表示' do |topic|
      topic.anonymous
    end
    column 'コメント' do |topic|
      topic.comments.count
    end
    column 'like' do |topic|
      topic.likes.count
    end
    column 'bad' do |topic|
      topic.bads.count
    end
    column '画像' do |topic|
      topic.images.count
    end
    column :created_at
    actions
  end

  show do |topic|
    attributes_table do
      row :id
      row "投稿者" do topic.user.nickname end
      row "タイトル" do topic.title end
      row "内容" do topic.text end
      row "カテゴリー" do topic.category.name end
      row "匿名表示" do topic.anonymous end
      row "コメント数" do topic.comments.count end
      row "like数" do topic.likes.count end
      row "bad数" do topic.bads.count end
      if topic.images.present?
        row "画像" do |images|
          topic.images.each do |image|
            image_tag image.url, height:"50px", width:"50px"
          end
        end
      else
        row "画像" do "画像無し" end
      end
      row :created_at
    end
    panel "このTopicへのコメント" do
      table_for topic.comments do
        column :id
        column 'コメント投稿者' do |comment|
          comment.user.nickname
        end
        column :comment
        column :anonymous
        column :created_at
      end
    end
    active_admin_comments
  end
end
