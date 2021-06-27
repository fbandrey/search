import Vue from 'vue'
import SearchApp from '../front/search_app.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#searchApp',
    template: '<search-app></search-app>',
    components: { SearchApp },
  })
});
