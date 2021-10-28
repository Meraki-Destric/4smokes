module ItemsHelper
  def user_add_to_library?(user, item)
    user.libraries.where(user: user, item: item).any?
  end
end
