<!DOCTYPE html>
<html>
<body>
<div id="vueApp">
    <breadcrumb></breadcrumb>
    <router-view></router-view>
</div>

<g:render template="list" />
<g:render template="show" />
<g:render template="form" />

<script type="text/javascript">
    const routes = [
        {path: '/', component: equipmentTypeList},
        {path: '/create', component: equipmentTypeForm},
        {path: '/show/:id', component: equipmentTypeShow},
        {path: '/edit/:id', component: equipmentTypeForm}
    ];

    const router = new VueRouter({
        routes
    });
    const app = new Vue({
        router
    }).$mount('#vueApp')
</script>
</body>
</html>