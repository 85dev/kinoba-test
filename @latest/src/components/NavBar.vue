<script setup>
</script>

<template>
<div class="navbar">
    <div class="links">
        <h3>kinoba test</h3>
        <div>
            <router-link to="/movies">Movies</router-link>
            <router-link style="margin-left: 1rem" to="/users">Users</router-link>
        </div>
    </div>
</div>
</template>

<style scoped>
.navbar {
    background-color: #333;
    position: absolute;
    right: 0;
    top: 0;
    width: 100%;
    height: 80px;
}

.links {
    display: flex;
    justify-content: space-between;
    padding: 0rem 2rem 0rem 2rem;
    align-items: center;
}
</style>