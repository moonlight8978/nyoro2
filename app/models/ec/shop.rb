class Ec::Shop < ApplicationRecord
  self.inheritance_column = :type

  belongs_to :user,
    class_name: :'User'
  has_many :products,
    class_name: :'Ec::Product'
  has_many :invoices,
    class_name: :'Ec::Invoice::ShopInvoice'

  def approved?
    type == 'Ec::ApprovedShop'
  end

  searchable do
    text :name, boost: 3
    text :email
    string :status do
      approved? ? 'approved' : 'unapproved'
    end
  end
end
