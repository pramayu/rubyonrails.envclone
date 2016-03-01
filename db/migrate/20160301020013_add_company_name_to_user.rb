class AddCompanyNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :region, :string
    add_column :users, :postal_code, :string
    add_column :users, :show_country, :boolean
    add_column :users, :profile_heading, :string
    add_column :users, :profile_text, :string
    add_column :users, :available_freelance, :boolean
    add_column :users, :behance, :string
    add_column :users, :deviantart, :string
    add_column :users, :dribbble, :string
    add_column :users, :facebook, :string
    add_column :users, :github, :string
    add_column :users, :googleplus, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
    add_column :users, :youtube, :string
    add_column :users, :reddit, :string
  end
end
