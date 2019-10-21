json.array!  @notifications do |notification|
  # json.recipient notification.recipient
  json.actor notification.actor.prénom
  json.action notification.action

  # NORIFIABLE
  json.notifiable do #notification.notifiable
    if notification.action == "candidature_create_proprio"
      json.type "demande vos services"
    elsif notification.action == "candidature_create_agent"
      json.type "propose ses services"
    elsif notification.action == "candidature_accept_proprio"
      json.type "accepte vos services"
    elsif notification.action == "candidature_accept_agent"
      json.type "accepte votre demande"
    elsif notification.action == "candidature_reject_proprio"
      json.type "rejète vos services"
    elsif notification.action == "candidature_reject_agent"
      json.type "rejète votre demande"
    elsif notification.action == "visit_agent"
      json.type "a prévu une visite"
    elsif notification.action == "rating_agent"
      json.type "a publié un avis"
    end
  end

  # URL
  if notification.action == "candidature_create_proprio"
    json.url candidature_agent_path
  elsif notification.action == "candidature_create_agent"
    json.url candidature_proprio_path
  elsif notification.action == "candidature_accept_proprio"
    json.url candidature_agent_path
  elsif notification.action == "candidature_accept_agent"
    json.url candidature_proprio_path
  elsif notification.action == "candidature_reject_proprio"
    json.url candidature_agent_path
  elsif notification.action == "candidature_reject_agent"
    json.url candidature_proprio_path
  elsif notification.action == "visit_agent"
    json.url meetings_path(visites: {from: 'proprio'})
  elsif notification.action == "rating_agent"
    json.url profile_path(current_user)
  end
end
