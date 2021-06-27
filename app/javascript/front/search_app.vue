<template>
  <div class="card my-5">
    <div class="card-body px-5 py-4">
      <div class="d-flex justify-content-between">
        <h3>Procedures</h3>
        <a href="/api/procedures.json" class="m-2" target="_blank">API endpoint</a>
      </div>

      <form @submit.prevent="search">
        <div class="input-group input-group-lg mt-3">
          <input v-model="query" class="form-control" type='text' autofocus="true" />
          <div class="input-group-append">
            <button class="btn btn-primary" type="submit">
              <em class="fa fa-search"></em>
              Search
            </button>
          </div>
        </div>
      </form>

      <div v-if="isLoading" class="text-center text-muted my-4">
        <em class="fa fa-spinner fa-spin fa-2x" />
      </div>

      <div v-if="!isLoading">
        <div v-if="items.length" class="my-3">
          <div v-if="items.length > 0" class="text-muted">
            <div class="d-flex justify-content-between">
              <span>Total count: {{ items.length }}</span>
              <button class="btn btn-link p-0" @click="reset">Reset</button>
            </div>
          </div>

          <ol class="mt-2">
            <li v-for="item in items" :key="item.id">
              <span v-html="highlighted(item.title)"></span>
            </li>
          </ol>
        </div>

        <div v-else class="text-center text-muted my-4">
          <em class="fa fa-thumb-tack mr-1" />
          No records found
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SearchApp',
  data: () => {
    return {
      query: '',
      items: [],
      isLoading: false,
    }
  },
  methods: {
    search: async function () {
      this.isLoading = true;
      const response = await fetch(`/api/procedures.json?q=${this.query}`);
      const data = await response.json();
      this.items = data.procedures;
      this.isLoading = false;
    },
    reset: function () {
      this.query = '';
      this.items = [];
    },
    highlighted: function (title) {
      const regex = new RegExp(this.query, 'gi');
      return title.replace(regex, function (str) { return '<mark class="p-0">'+str+'</mark>' });
    },
  },
};
</script>
