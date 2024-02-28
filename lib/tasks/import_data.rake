
namespace :import do
    desc "Import sample CSV data"
    task sample_data: :environment do
      require 'csv'
  
      csv_path = Rails.root.join('input_csv')
  
      CSV.foreach(csv_path.join('users.csv'), headers: true, skip_blanks: true) do |row|
        User.create!(username: row['USERNAME'] , email: row['EMAIL'] , phone: row['PHONE'] )
      end
  
      CSV.foreach(csv_path.join('products.csv'), headers: true, skip_blanks: true) do |row|
        Product.create!(code: row['CODE'], name: row['NAME'], category: row['CATEGORY'])
      end
  
      CSV.foreach(csv_path.join('order_details.csv'), headers: true, skip_blanks: true) do |row|
        OrderDetail.create!(user_email: row['USER_EMAIL'], product_code: row['PRODUCT_CODE'], order_date: row['ORDER_DATE'])
      end
  
      puts "Sample CSV data imported successfully!"
    end
  end
  