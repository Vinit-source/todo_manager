class User < ApplicationRecord
  def display_string
    "#{id}.#{name}"
  end
end
