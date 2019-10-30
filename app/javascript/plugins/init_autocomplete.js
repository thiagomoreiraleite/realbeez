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

const initAutocompleteProfileVille = () => {
  const addressInputProfileVille = document.getElementById('user_ville');
  if (addressInputProfileVille) {
    places({ container: addressInputProfileVille });
  }
};

export { initAutocomplete };
export { initAutocompleteAnnonce };
export { initAutocompleteProfile };
export { initAutocompleteProfileVille };
