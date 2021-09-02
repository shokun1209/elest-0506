ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :nickname, :public_uid, :image, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :nickname, :public_uid, :image, :admin, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # permit_params :email, :encrypted_password, :nickname, :public_uid, :image, :admin

  index do
    selectable_column
    id_column
    column 'ニックネーム' do |user|
      user.nickname
    end
    column :email
    column '投稿数' do |user|
      user.topics.count
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |user|
    attributes_table do
      if user.image.present?
        row "アイコン" do |image|
          image_tag image.image.url, height:"50px", width:"50px"
        end
      else
        row "アイコン" do "アイコン無し" end
      end
      row "ニックネーム" do user.nickname end
      row "匿名ID" do user.public_uid end
      row :email
      row "管理者ユーザー" do user.admin end
      row :created_at
    end
    panel "トピック一覧" do
      table_for user.topics do
        column :id
        column :title
        column :text
        column :anonymous
        column :created_at
      end
    end
    panel "コメント一覧" do
      table_for user.comments do
        column :id
        column :comment
        column :anonymous
        column :created_at
      end
    end
    active_admin_comments
  end
end
