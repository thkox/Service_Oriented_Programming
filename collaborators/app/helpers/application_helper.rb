require_relative 'navigation_helper'

module ApplicationHelper
  include NavigationHelper
  include PostsHelper
  include Private::MessagesHelper
  include Private::ConversationsHelper
  include Group::ConversationsHelper

  def private_conversations_windows
    params[:controller] != 'messengers' ? @private_conversations_windows : []
  end
end