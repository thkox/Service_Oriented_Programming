<% add_people_to_conv_list = add_people_to_group_conv_list(conversation) %>
<% @is_messenger = false %>
<li class="conversation-window" id="gc<%= conversation.id %>" data-turbo-permanent>
  <div class="panel panel-default" data-gconversation-id="<%= conversation.id %>">
    <%= render 'group/conversations/conversation/heading',
               conversation: conversation %>
    <%= render 'group/conversations/conversation/select_users',
               conversation: conversation,
               add_people_to_conv_list: add_people_to_conv_list %>
    <div class="panel-body">
      <%= render 'group/conversations/conversation/messages_list',
                 conversation: conversation %>
      <%= render 'group/conversations/conversation/new_message_form',
                 conversation: conversation,
                 user: user %>
    </div><!-- panel-body -->
  </div><!-- panel -->
</li>