import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import create from '@/components/create'
import edit from '@/components/edit'
import show from '@/components/show'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/create',
      name: 'create',
      component: create
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
    }
  ]
})
