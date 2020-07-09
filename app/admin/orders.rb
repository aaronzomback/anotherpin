ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :address_1, :address_2, :city, :postal_code, :country,
  # to be able to edit and update changes to our order items and their quantities in admin
  order_items_attributes: [:id, :product_id, :quantity]

  index do selectable_column
    id_column
    column :name do |order|
      order.first_name + " " + order.last_name
    end
    column :email
    column :city
    column :country
  end

form do |f|
  f.inputs do
    f.input :first_name
    f.input :last_name
    f.input :email
  f.inputs "Address" do
    f.input :address_1
    f.input :address_2
    f.input :city
    f.input :postal_code
    f.input :country
  end
end

  f.has_many :order_items, heading: "Items" do |item_form|
    item_form.input :product
    item_form.input :quantity

  end

  f.actions
end




end
