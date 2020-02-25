const ajouterLocataire = () => {
  const locataire = document.querySelector("#ajouter_locataire");
  const form = document.querySelector("#ajouter_form");
  let counter = 0;
  locataire.addEventListener("click", (event) => {
    console.log(event)
    counter += 1;
    form.insertAdjacentHTML('beforeend',
      `
      <div>
        <p class="mt-5 border-top pt-3" style="color: #D8A727; font-weight: bold">COLOCATAIRE</p>
        <div class="form-group string optional locataire_locataire_supplementaires_prenom"><label class="form-control-label string optional" for="locataire_locataire_supplementaires_attributes_${counter}_prenom">Prenom</label><input class="form-control string optional" type="text" name="locataire[locataire_supplementaires_attributes][${counter}][prenom]" id="locataire_locataire_supplementaires_attributes_${counter}_prenom"></div>
        <div class="form-group string optional locataire_locataire_supplementaires_nom"><label class="form-control-label string optional" for="locataire_locataire_supplementaires_attributes_${counter}_nom">Nom</label><input class="form-control string optional" type="text" name="locataire[locataire_supplementaires_attributes][${counter}][nom]" id="locataire_locataire_supplementaires_attributes_${counter}_nom"></div>
        <div class="form-group string optional locataire_locataire_supplementaires_adresse"><label class="form-control-label string optional" for="locataire_locataire_supplementaires_attributes_${counter}_adresse">Adresse</label><input class="form-control string optional" type="text" name="locataire[locataire_supplementaires_attributes][${counter}][adresse]" id="locataire_locataire_supplementaires_attributes_${counter}_adresse"></div>
        <div class="form-group string optional locataire_locataire_supplementaires_ville"><label class="form-control-label string optional" for="locataire_locataire_supplementaires_attributes_${counter}_ville">Ville</label><input class="form-control string optional" type="text" name="locataire[locataire_supplementaires_attributes][${counter}][ville]" id="locataire_locataire_supplementaires_attributes_${counter}_ville"></div>
        <div class="form-group string optional locataire_locataire_supplementaires_tel"><label class="form-control-label string optional" for="locataire_locataire_supplementaires_attributes_${counter}_tel">Téléphone</label><input class="form-control string optional" type="text" name="locataire[locataire_supplementaires_attributes][${counter}][tel]" id="locataire_locataire_supplementaires_attributes_${counter}_tel"></div>
        <div class="form-group email optional locataire_locataire_supplementaires_email"><label class="form-control-label email optional" for="locataire_locataire_supplementaires_attributes_${counter}_email">Email</label><input class="form-control string email optional" type="email" name="locataire[locataire_supplementaires_attributes][${counter}][email]" id="locataire_locataire_supplementaires_attributes_${counter}_email"></div>
        <p class="mt-4" style="color: #D8A727">Pièce d'identité (recto / verso) ou passeport</p>
        <div class="form-group file optional locataire_locataire_supplementaires_id_recto"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][id_recto]" id="locataire_locataire_supplementaires_attributes_${counter}_id_recto"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_id_recto_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][id_recto_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_id_recto_cache"></div>
        <div class="form-group file optional locataire_locataire_supplementaires_id_verso"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][id_verso]" id="locataire_locataire_supplementaires_attributes_${counter}_id_verso"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_id_verso_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][id_verso_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_id_verso_cache"></div>
        <p class="mt-4" style="color: #D8A727">Justificatif de domicile</p>
        <div class="form-group file optional locataire_locataire_supplementaires_justif_dom"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][justif_dom]" id="locataire_locataire_supplementaires_attributes_${counter}_justif_dom"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_justif_dom_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][justif_dom_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_justif_dom_cache"></div>
        <p class="mt-4" style="color: #D8A727">3 derniers bulletin de salaire</p>
        <div class="form-group file optional locataire_locataire_supplementaires_fiche_paye_mois1"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois1]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois1"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_fiche_paye_mois1_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois1_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois1_cache"></div>
        <div class="form-group file optional locataire_locataire_supplementaires_fiche_paye_mois2"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois2]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois2"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_fiche_paye_mois2_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois2_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois2_cache"></div>
        <div class="form-group file optional locataire_locataire_supplementaires_fiche_paye_mois3"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois3]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois3"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_fiche_paye_mois3_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][fiche_paye_mois3_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_fiche_paye_mois3_cache"></div>
        <p class="mt-4" style="color: #D8A727">Contrat de travail</p>
        <div class="form-group file optional locataire_locataire_supplementaires_contrat"><input class="form-control-file file optional" type="file" name="locataire[locataire_supplementaires_attributes][${counter}][contrat]" id="locataire_locataire_supplementaires_attributes_${counter}_contrat"></div>
        <div class="form-group hidden locataire_locataire_supplementaires_contrat_cache"><input class="form-control hidden" type="hidden" name="locataire[locataire_supplementaires_attributes][${counter}][contrat_cache]" id="locataire_locataire_supplementaires_attributes_${counter}_contrat_cache"></div>
      </div>
      `
    );
  });
}

const supprimerLocataire = () => {
  const form = document.querySelector("#ajouter_form");
  let supprimer = document.querySelector("#supprimer_locataire")
  supprimer.addEventListener("click", (event) => {
  // console.log(event.target.previousElementSibling);
  // const formNew = event.target.previousElementSibling
  // form.removeChild(formInput)
  // while (form.lastChild) {
  form.removeChild(form.lastChild);
  // }
  });
}


export { ajouterLocataire }
export { supprimerLocataire }
