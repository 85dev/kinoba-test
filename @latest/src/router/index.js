import { createRouter, createWebHistory } from 'vue-router'

import Users from '../components/Users.vue';
import Movies from '../components/Movies.vue';
import MovieDetails from '../components/MovieDetails.vue';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/users',
            component: Users,
        },
        {
            path: '/movies',
            component: Movies,
        },
        {
            path: '/movies/:id',
            name: 'MovieDetails',
            component: MovieDetails,
            props: true
        },
        {
            path: '/',
            redirect: '/movies'
        }
    ]
})

export default router