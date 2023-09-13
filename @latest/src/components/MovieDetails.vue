<script setup>
import { defineProps, ref, onMounted } from 'vue';

const API_URL = import.meta.env.VITE_API_URL;
const API_IMAGE_URL = import.meta.env.VITE_API_IMAGE_URL;

const movie = ref({})
const matchingUsers = ref([])
const showInterestedUsers = ref(false)

const props = defineProps({
    id: String,
    required: true,
});

const fetchPotentialWatchers = async (id) => {
    await fetch(`${API_URL}/movies/${id}/potential_watchers`)
        .then((response) => response.json())
        .then((response) => matchingUsers.value = response)
        .catch(console.error);
};

const fetchMovie = async () => {
    await fetch(`${API_URL}/movies/${props.id}`)
        .then(response => response.json())
        .then(response => movie.value = response)
        .catch(err => console.error(err));
}

const toggleShowInterestedUsers = () => {
    showInterestedUsers.value = !showInterestedUsers.value
    console.log(showInterestedUsers.value)
}

onMounted(async () => {
    await fetchMovie();
    await fetchPotentialWatchers(props.id);
});

</script>

<template>
    <div style="margin-top: 130px">
        <div class="title-input">
            <h1>Movie Details</h1>
        </div>
        <div class="container">
            <div class="card">
                <div v-if="movie.backdrop_path">
                    <img :src="`${API_IMAGE_URL}${movie.backdrop_path}`" class="movie-img"/>
                </div>
                <h2>{{ movie.original_title }}</h2>
                <p style="margin: 0rem 2rem">{{ movie.overview }}</p>
                <p> Rating : {{ movie.vote_average }}</p>
                <button @click="toggleShowInterestedUsers">
                    {{ showInterestedUsers ? "Hide" : "Show"}} Interested Users
                </button>
                <div v-if="showInterestedUsers === true" class="user-container">
                    <div v-for="user in matchingUsers">
                        <div>
                            <img :src="user.picture_url" class="user-img">
                            <p style="margin-top: -3px"> {{ user.pseudo }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.container { 
  display: flex;
  justify-content: center;
  max-width: 1400px;
  width: 80%;
  height: auto;
  margin: 0 auto;
  margin-bottom: 1.5em;
}

.movie-img {
    width: 100%;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
}

button {
    margin: 2rem;
}

.user-container {
    margin-top: 1rem;
    display: flex;
    padding: 0.5rem;
    flex-direction: row;
    justify-content: space-evenly;
}

.user-img {
    width: 80px;
    border-radius: 50%;
    background: #565656;
}

.card {
    padding: 0;
    max-width: 80%;
    border-radius: 8px;
    background: #434343;
    display: flex;
    flex-direction: column;
}

</style>