// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const test = () => { console.log('hello word')};

document.addEventListener('DOMContentLoaded', function(){

  const contacts = document.querySelectorAll('.contact-card-mini');
  contacts.forEach((contact) => {
      contact.addEventListener('click', () => {
        const editCards = document.querySelectorAll('.card-edit-contact')
        editCards.forEach(card => card.classList.add('invisible'));
        const id = "#edit-"+contact.attributes.id.value.split('-')[1];
        const editCard = document.querySelector(id);
        editCard.classList.remove('invisible');
        console.log(editCard.classList);
    });
  });
  console.log(contacts);









}, false);



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
