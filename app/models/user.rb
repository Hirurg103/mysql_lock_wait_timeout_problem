class User < ApplicationRecord
  default_scope { where(archived: false) }
end
