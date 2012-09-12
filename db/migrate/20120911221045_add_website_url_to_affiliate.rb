class AddWebsiteUrlToAffiliate < ActiveRecord::Migration
  def change
    add_column :affiliates, :website_url, :string
  end
end
