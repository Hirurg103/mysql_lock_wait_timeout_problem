class Users::UpdateName
  def call
    User
      .unscoped
      .find_in_batches do |batch|
        update_batch(batch)
    end
  end

  def update_batch(users_batch)
    users_batch
      .each_slice(100)
      .map { |users| Thread.new { update_all(users) } }
      .each(&:join)
  end

  def update_all(users)
    users.each { |u| u.update_columns(first_name: 'John') }
  end
end
