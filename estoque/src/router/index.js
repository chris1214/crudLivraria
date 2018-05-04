import Vue from 'vue'
import Router from 'vue-router'
import edit from '@/components/edit'
import show from '@/components/show'
import list from '@/components/list'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'list',
      component: list
    },
    {
      path: '/edit/:id',
      name: 'edit',
      component: edit,
      props: true
    },
    {
      path: '/show/:id',
      name: 'show',
      component: show,
      props: true
    },
  ]
})
