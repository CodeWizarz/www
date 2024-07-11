import Vue from 'vue';
import SpeakersBureau from '../components/speakers-bureau/SpeakersBureau.vue';

document.addEventListener('DOMContentLoaded', () => {
  const speakers = document.querySelectorAll('.speakers-bureau');

  speakers.forEach((el) => {
    new Vue({
      el: el,
      components: {
        SpeakersBureau,
      },
      render(createElement) {
        return createElement(SpeakersBureau, {
          props: {
            initialRole: el.dataset.role,
          },
        });
      },
    });
  });
});
