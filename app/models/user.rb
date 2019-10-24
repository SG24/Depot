class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  private

  def ensure_an_admin_remains
    # to only abort the transaction and not otherwise signal an exception
    # raise ActiveRecord::Rollback exception instead, it won't be passed
    # on by ActiveRecord::Base.transaction
    raise Error, "Can't delete last user" if User.count.zero?
  end
end
