import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('annonce_adresse');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteAnnonce = () => {
  const addressInputAnnonce = document.getElementById('search_query');
  if (addressInputAnnonce) {
    places({ container: addressInputAnnonce });
  }
};

const initAutocompleteProfile = () => {
  const addressInputProfile = document.getElementById('user_adresse');
  if (addressInputProfile) {
    places({ container: addressInputProfile });
  }
};

export { initAutocomplete };
export { initAutocompleteAnnonce };
export { initAutocompleteProfile };
