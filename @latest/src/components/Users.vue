<script setup>
import { ref, onMounted } from 'vue'
const users = ref({});

const fetchUsers = async () => {
  try {
    const response = await fetch('http://localhost:3000/users', {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
      }
    });
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    users.value = await response.json();
    console.log(response);
  } catch (error) {
    console.error('Error fetching users:', error);
  }
}

onMounted(async () => {
  await fetchUsers();
});

</script>

<template>
  <div style="margin-top: 130px">

  <div class="title-input">
    <h1>Users</h1>
  </div>

  <div class="container">
    <div v-for="user in users" :key="user.id">
      <div class="card">
        <img class="img" :src="user.picture_url"/>
        <h2>{{ user.pseudo }}</h2>
        <h4 style="margin-top: 10px">FAVORITE GENRES</h4>
        <ul v-for="fav_genre in JSON.parse(user.favorite_genders)" style="list-style: none;">
          <li> {{ fav_genre }} </li>
        </ul>
        <h4 style="margin-top: 10px">HATED GENRES</h4>
        <ul v-for="fav_genre in JSON.parse(user.hated_genders)" style="list-style: none; margin-bottom: 10px">
          <li> {{ fav_genre }} </li>
        </ul>
      </div>
    </div>
  </div>
      
</div>
</template>

<style scoped>
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
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

.card {
  border-radius: 8px;
  background: #434343;
  display: flex;
  flex-direction: column;
}

.img {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
.title-input {
  text-align: center;
  border-radius: 4px;
  padding: 4px;
  margin-bottom: 20px;
}
</style>
