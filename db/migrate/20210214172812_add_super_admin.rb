class AddSuperAdmin < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
      u.name = "Super Admin"
      u.email = "admin@admin.com"
      u.password = "123456"
      u.admin = true
    end
  end
end
