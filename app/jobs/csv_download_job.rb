require 'csv'
class CsvDownloadJob < ApplicationJob
    queue_as :default
  
    def perform(user_id)
      user = User.find_by(id: user_id)
      email = user.email
      orders = OrderDetail.where(user_email: email)
      csv_data = generate_csv_data(orders)
  
      file_path = "#{Rails.root}/tmp/#{user.username}_orders.csv"
      File.open(file_path, 'w') { |file| file.write(csv_data) }
  
      
    end
  
    private
  
    def generate_csv_data(orders)
      csv_data = CSV.generate(headers: true) do |csv|
        csv << %w[User_Email Product_Code Purchase_Date]
  
        orders.each do |order|
          csv << [order.user_email, order.product_code, order.order_date]
        end
      end
  
      csv_data
    end
  end
  