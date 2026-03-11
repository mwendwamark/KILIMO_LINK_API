module Community
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    # GET /community/conversations
    def conversations
      convos = current_user.conversations
                           .includes(:users, messages: :user)
                           .order(updated_at: :desc)

      render json: {
        success: true,
        conversations: convos.map { |c| conversation_json(c) }
      }
    end

    # GET /community/conversations/:id/messages
    def show
      convo = current_user.conversations.find(params[:id])
      messages = convo.messages.order(created_at: :asc)
                      .includes(:user)
                      .page(params[:page] || 1).per(50)

      render json: {
        success: true,
        conversation: conversation_json(convo),
        messages: messages.map { |m| message_json(m) },
        meta: pagination_meta(messages)
      }
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "Conversation not found" }, status: :not_found
    end

    # POST /community/conversations
    def create_conversation
      other_user = User.find(params[:user_id])

      if other_user.id == current_user.id
        return render json: { success: false, error: "Cannot message yourself" }, status: :unprocessable_entity
      end

      convo = Conversation.between(current_user.id, other_user.id)

      unless convo
        convo = Conversation.create!(title: nil)
        convo.conversation_participants.create!(user: current_user, joined_at: Time.current)
        convo.conversation_participants.create!(user: other_user, joined_at: Time.current)
      end

      render json: { success: true, conversation: conversation_json(convo) }, status: :created
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "User not found" }, status: :not_found
    end

    # POST /community/conversations/:id/messages
    def send_message
      convo = current_user.conversations.find(params[:id])
      message = convo.messages.build(
        user: current_user,
        body: params[:body]
      )

      if message.save
        convo.touch
        render json: { success: true, message: message_json(message) }, status: :created
      else
        render json: { success: false, errors: message.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: "Conversation not found" }, status: :not_found
    end

    private

    def conversation_json(convo)
      other_users = convo.users.where.not(id: current_user.id)
      last_msg = convo.messages.order(created_at: :desc).first
      unread_count = convo.messages.where(user_id: other_users.pluck(:id))
                          .where(read_at: nil).count

      {
        id: convo.id,
        participants: other_users.map { |u| user_summary(u) },
        last_message: last_msg ? {
          body: last_msg.body,
          sent_at: last_msg.created_at,
          sent_by_me: last_msg.user_id == current_user.id
        } : nil,
        unread_count: unread_count,
        updated_at: convo.updated_at
      }
    end

    def message_json(msg)
      {
        id: msg.id,
        body: msg.body,
        sent_by_me: msg.user_id == current_user.id,
        read_at: msg.read_at,
        created_at: msg.created_at,
        sender: user_summary(msg.user)
      }
    end

    def user_summary(user)
      profile = user.farmer_profile || user.buyer_profile
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        avatar_url: profile&.profile_picture&.attached? ? url_for(profile.profile_picture) : nil
      }
    end

    def pagination_meta(collection)
      {
        current_page: collection.current_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count,
        has_next_page: collection.next_page.present?
      }
    end
  end
end
