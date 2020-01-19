const ajouterDocument = () => {
  const dossier = document.querySelector("#ajouter_document");
  const documentForm = document.querySelector("#document_form");
  let counter = 0;
  dossier.addEventListener("click", (event) => {
    counter  =  Number((event.timeStamp).toFixed(0));
    console.log(counter)
    documentForm.insertAdjacentHTML('beforeend',
      `
      <div>
        <div class="form-group string optional locataire_documents_titre"><input class="form-control string optional" placeholder="Nom du fichier" type="text" name="locataire[documents_attributes][${counter}][titre]" id="locataire_documents_attributes_${counter}_titre"></div>
        <div class="form-group file optional locataire_documents_piece_jointe form-group-valid"><input class="form-control-file is-valid file optional" type="file" name="locataire[documents_attributes][${counter}][piece_jointe]" id="locataire_documents_attributes_${counter}_piece_jointe"></div>
      </div>
      `
    );
  });
}

const supprimerDocument = () => {
  const documentForm = document.querySelector("#document_form");
  let supprimer = document.querySelector("#supprimer_document");
  supprimer.addEventListener("click", (event) => {
  // console.log(event.target.previousElementSibling);
  // const formNew = event.target.previousElementSibling
  // form.removeChild(formInput)
  // while (form.lastChild) {
  documentForm.removeChild(documentForm.lastChild);
  // }
  });
}

export { ajouterDocument }
export { supprimerDocument }
