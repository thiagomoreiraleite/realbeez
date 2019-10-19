json.array!  @notifications do |notification|
  # json.recipient notification.recipient
  json.actor notification.actor.prénom
  json.action notification.action

  # NORIFIABLE
  json.notifiable do #notification.notifiable
    if notification.action == "candidature_create_proprio"
      json.type "demande vos services"
    elsif notification.action == "candidature_create_agent"
      json.type "postule pour louer votre bien"
    end
  end

  # URL
  if notification.action == "candidature_create_proprio"
    json.url candidature_agent_path
  elsif notification.action == "candidature_create_agent"
    json.url candidature_proprio_path
  end
end
