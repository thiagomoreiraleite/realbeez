json.array!  @notifications do |notification|
  # json.recipient notification.recipient
  json.actor notification.actor.prénom
  json.action notification.action

  # NOTIFIABLE
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
    # elsif notification.action == "candidature_become_agent_RB"
    #   json.type "a postulé pour devenir agent"
    elsif notification.action == "candidature_accept_agent_RB"
      json.type "accepte votre candidature"
    elsif notification.action == "candidature_decline_agent_RB"
      json.type "rejète votre candidature"
    # elsif notification.action == "candidature_update_agent_RB"
    #   json.type "a modifié son profil agent"
    elsif notification.action == "checkout_agent_notify_admin"
      json.type "a loué un bien"
    elsif notification.action == "checkout_agent_notify_proprio"
      json.type "a loué votre bien"
    elsif notification.action == "checkout_proprio_notify_admin"
      json.type "confirme avoir loué son bien"
    elsif notification.action == "checkout_proprio_notify_agent"
      json.type "confirme avoir loué son bien"
    elsif notification.action == "create_locataire_notify_agent"
      json.type "a déposé un dossier de location"
    elsif notification.action == "create_locataire_notify_proprio"
      json.type "a déposé un dossier de location"
    elsif notification.action == "accept_locataire_notify_agent"
      json.type "accepte un dossier de location"
    elsif notification.action == "accept_locataire_notify_locataire"
      json.type "accepte votre dossier de location"
    elsif notification.action == "reject_locataire_notify_agent"
      json.type "rejète un dossier de location"
    elsif notification.action == "reject_locataire_notify_locataire"
      json.type "rejète votre dossier de location"
    elsif notification.action == "update_locataire_notify_agent"
      json.type "a mis à jour son dossier de location"
    elsif notification.action == "update_locataire_notify_proprio"
      json.type "a mis à jour son dossier de location"
    elsif notification.action == "destroy_locataire_notify_agent"
      json.type "a supprimé son dossier de location"
    elsif notification.action == "destroy_locataire_notify_proprio"
      json.type "a supprimé son dossier de location"
    elsif notification.action == "create_bail_notify_agent"
      json.type "a créé un dossier de location"
    elsif notification.action == "create_bail_notify_locataire"
      json.type "a créé un dossier de location"
    elsif notification.action == "create_bail_notify_proprio"
      json.type "a créé un dossier de location"
    elsif notification.action == "create_mandat_notify_proprio"
      json.type "a préparé le mandat de location"
    elsif notification.action == "create_annonce_notify_proprio"
      json.type "a publié votre annonce"
    # elsif notification.action == "new_registration"
    #   json.type "s'est inscrit sur RB"
    end
  end


  # URL
  if notification.action == "candidature_create_proprio"
     if notification.notifiable != nil
      json.url show_agent_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "candidature_create_agent"
    if notification.notifiable != nil
      json.url show_proprio_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "candidature_accept_proprio"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable.annonce)
    else
      json.url root_path
    end
  elsif notification.action == "candidature_accept_agent"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable.annonce)
    else
      json.url root_path
    end
  elsif notification.action == "candidature_reject_proprio"
    if notification.notifiable != nil
      json.url candidature_agent_path
    else
      json.url root_path
    end
  elsif notification.action == "candidature_reject_agent"
    if notification.notifiable != nil
      json.url candidature_proprio_path
    else
      json.url root_path
    end
  elsif notification.action == "visit_agent"
    if notification.notifiable != nil
      json.url meetings_path(visites: {from: 'proprio'})
    else
      json.url root_path
    end
  elsif notification.action == "rating_agent"
    if notification.notifiable != nil
      json.url profile_path(current_user)
    else
      json.url root_path
    end
  # elsif notification.action == "candidature_become_agent_RB"
  #   json.url agents_path
  elsif notification.action == "candidature_accept_agent_RB"
    if notification.notifiable != nil
      json.url profile_path(notification.notifiable.user)
    else
      json.url root_path
    end
  elsif notification.action == "candidature_decline_agent_RB"
    if notification.notifiable != nil
      json.url profile_path(notification.notifiable.user)
    else
      json.url root_path
    end
  # elsif notification.action == "candidature_update_agent_RB"
  #   if notification.notifiable != nil
  #     json.url agents_path
  #   else
  #     json.url root_path
  #   end
  elsif notification.action == "checkout_agent_notify_admin"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "checkout_agent_notify_proprio"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "checkout_proprio_notify_admin"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable.annonce)
    else
      json.url root_path
    end
  elsif notification.action == "checkout_proprio_notify_agent"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "create_locataire_notify_agent"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "create_locataire_notify_proprio"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "accept_locataire_notify_agent"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "accept_locataire_notify_locataire"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "reject_locataire_notify_agent"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "reject_locataire_notify_locataire"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "update_locataire_notify_agent"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "update_locataire_notify_proprio"
    if notification.notifiable != nil
      json.url locataire_candidature_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "destroy_locataire_notify_agent"
    if notification.notifiable != nil
      json.url locataires_agent_path
    else
      json.url root_path
    end
  elsif notification.action == "destroy_locataire_notify_proprio"
    if notification.notifiable != nil
      json.url locataires_proprio_path
    else
      json.url root_path
    end
  elsif notification.action == "create_bail_notify_agent"
    if notification.notifiable != nil
      json.url contrat_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "create_bail_notify_locataire"
    if notification.notifiable != nil
      json.url contrat_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "create_bail_notify_proprio"
    if notification.notifiable != nil
      json.url contrat_path(notification.notifiable)
    else
      json.url root_path
    end
  elsif notification.action == "create_mandat_notify_proprio"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable.annonce)
    else
      json.url root_path
    end
  elsif notification.action == "create_annonce_notify_proprio"
    if notification.notifiable != nil
      json.url annonce_path(notification.notifiable)
    else
      json.url root_path
    end
  # elsif notification.action == "new_registration"
  #   json.url profile_all_users_path
  end
end
