class PaymentTypeCreate < ActiveRecord::Migration
  def up
    PayType.create(name: 'Check')
    PayType.create(name: 'Credit Cart')
    PayType.create(name: 'Purchase Order')

    Order.reset_column_information
    Order.all.each do |order|
      order.pay_type_id = case order.pay_type
                              when 'Check'
                                1
                              when 'Credit Cart'
                                2
                              when 'Purchase Order'
                                3
                              end
      order.save validate: false
    end
    Order.reset_column_information
    remove_column :orders, :pay_type
  end

  def down
    PayType.delete(name: 'Check')
    PayType.delete(name: 'Credit Cart')
    PayType.delete(name: 'Purchase Order')

    add_column :orders, :pay_type, :string
    Order.reset_column_information
    Order.all.each do |order|
      order.pay_type = case order.pay_type_id
                              when 1
                                'Check'
                              when 2
                                'Credit Cart'
                              when 3
                                'Purchase Order'
                              end
      order.pay_type_id = 0
      order.save validate: false
    end
    Order.reset_column_information
  end
end
