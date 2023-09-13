<script setup>
import { onMounted, ref, watch } from 'vue';

const API_URL = import.meta.env.VITE_API_URL;
const API_IMAGE_URL = import.meta.env.VITE_API_IMAGE_URL;

const movies = ref([])
const page = ref(1)
const total_pages = ref(1);

const fetchMovies = async () => {
    await fetch(`${API_URL}/movies?page=${page.value}`)
        .then(response => response.json())
        .then(response => {
            movies.value = response.results,
            total_pages.value = response.total_pages
        })
        .catch(err => console.error(err));
    console.log(movies.value);
}

onMounted(async () => {
    await fetchMovies();
});

const incrementPageNumber = () => page.value++;

const decrementPageNumber = () => page.value--;

watch(page, () => {
    fetchMovies();
})

</script>

<template>
    <div style="margin-top: 130px">
        <div class="title-input">
        <h1>Movies</h1>
        </div>
        <div class="container">
            <div v-for="movie in movies" :key="movie.id" class="card">
                <img :src="`${API_IMAGE_URL}${movie.backdrop_path}`"/>
                <div class="inner-card">        
                <h2>{{movie.original_title}}</h2>
                <div style="display:flex; justify-content: center;">
                    <button>
                        <router-link :to="{ name: 'MovieDetails', params:{ id: movie.id } }"> Movie Details </router-link>
                    </button>
                </div>
            </div>
            </div>
        </div>
        <div class="button-pages">
            <button @click="decrementPageNumber" style="margin-right: 1rem; hover: none" :disabled="page === 1">
                &lt
            </button>
            <h3  style="margin-right: 1rem">{{ page }}/{{ total_pages }} </h3>
            <button @click="incrementPageNumber">
                &gt
            </button>
        </div>

    </div>
</template>

<style scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

button {
    text-align: center;
    width: 100px;
}

button:disabled:hover {
    border-color: transparent;
    cursor: not-allowed;
}

.button-pages {
    display: flex;
    flex-direction: row;
    justify-content: center;
}
.container { 
  display: grid;
  grid-template-columns: repeat(auto-fill, 300px);
  justify-content: center;
  grid-gap: 30px;
  max-width: 1400px;
  width: 80%;
  height: auto;
  margin: 0 auto;
  margin-bottom: 1.5em;
}

.inner-card h2 {
    line-height: 1;
}

img {
    border-top-right-radius: 8px;
    border-top-left-radius: 8px;
}

.card {
  border-radius: 8px;
  background: #434343;
  display: flex;
  flex-direction: column;
  height: 300px;
}

.inner-card {
    display: flex;
    justify-content: space-between;
    flex-direction: column;
    padding: 0.5rem 1rem 1rem 1rem;
    height: 100%;
}
.img {
  border-radius: 10px;
  margin: 10px 10px;
}
.title-input {
  text-align: center;
  border-radius: 4px;
  padding: 4px;
  margin-bottom: 20px;
}
</style>