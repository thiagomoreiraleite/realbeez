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
    elsif notification.action == "candidature_become_agent_RB"
      json.type "a postulé pour devenir agent"
    elsif notification.action == "candidature_accept_agent_RB"
      json.type "accepte votre candidature"
    elsif notification.action == "candidature_decline_agent_RB"
      json.type "rejète votre candidature"
    elsif notification.action == "candidature_update_agent_RB"
      json.type "a modifié son profil agent"
    elsif notification.action == "checkout_agent_notify_admin"
      json.type "a loué un bien"
    elsif notification.action == "checkout_agent_notify_proprio"
      json.type "a loué votre bien"
    elsif notification.action == "checkout_proprio_notify_admin"
      json.type "confirme la location de son bien"
    elsif notification.action == "checkout_proprio_notify_agent"
      json.type "confirme la location de son bien"
    end
  end

  # URL
  if notification.action == "candidature_create_proprio"
    json.url show_agent_path(notification.notifiable)
  elsif notification.action == "candidature_create_agent"
    json.url show_proprio_path(notification.notifiable)
  elsif notification.action == "candidature_accept_proprio"
    json.url annonce_path(notification.notifiable.annonce)
  elsif notification.action == "candidature_accept_agent"
    json.url annonce_path(notification.notifiable.annonce)
  elsif notification.action == "candidature_reject_proprio"
    json.url candidature_agent_path
  elsif notification.action == "candidature_reject_agent"
    json.url candidature_proprio_path
  elsif notification.action == "visit_agent"
    json.url meetings_path(visites: {from: 'proprio'})
  elsif notification.action == "rating_agent"
    json.url profile_path(current_user)
  elsif notification.action == "candidature_become_agent_RB"
    json.url agents_path
  elsif notification.action == "candidature_accept_agent_RB"
    json.url profile_path(notification.notifiable.user)
  elsif notification.action == "candidature_decline_agent_RB"
    json.url profile_path(notification.notifiable.user)
  elsif notification.action == "candidature_update_agent_RB"
    json.url agents_path
  elsif notification.action == "checkout_agent_notify_admin"
    json.url annonce_path(notification.notifiable.annonce)
  elsif notification.action == "checkout_agent_notify_proprio"
    json.url annonce_path(notification.notifiable.annonce)
  elsif notification.action == "checkout_proprio_notify_admin"
    json.url annonce_path(notification.notifiable.annonce)
  elsif notification.action == "checkout_proprio_notify_agent"
    json.url annonce_path(notification.notifiable.annonce)
  end
end
